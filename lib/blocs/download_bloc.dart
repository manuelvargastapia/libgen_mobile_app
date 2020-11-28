import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:libgen/data/download_repository.dart';
import 'package:libgen/domain/book_model.dart';
import 'package:libgen/domain/task_info_model.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:libgen/blocs/events/download_event.dart';
import 'package:libgen/blocs/states/download_state.dart';
import 'package:libgen/data/book_repository.dart';
import 'package:libgen/domain/download_link_model.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  BookRepository bookRepository;
  DownloadRepository downloadRepository;
  bool isDownloading = false;
  ReceivePort _port = ReceivePort();

  DownloadBloc({
    @required BookRepository bookRepository,
    @required DownloadRepository downloadRepository,
  }) : super(DownloadInitialState()) {
    this.bookRepository = bookRepository;
    this.downloadRepository = downloadRepository;

    _bindBackgroundIsolate();
    FlutterDownloader.registerCallback(_downloadCallback);
  }

  @override
  Future<void> close() {
    _unbindBackgroundIsolate();
    return super.close();
  }

  static void _downloadCallback(
    String id,
    DownloadTaskStatus status,
    int progress,
  ) {
    final SendPort send = IsolateNameServer.lookupPortByName(
      'downloader_send_port',
    );
    send.send([id, status, progress]);
  }

  void _bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
    });
  }

  void _unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  String _generateFileName(BookModel book) {
    final title = book.title ?? book.series ?? book.isbn ?? "untitled";
    final author = book.author != null ? " - " + book.author : "";
    final publisher = book.publisher != null ? " - " + book.publisher : "";
    final year = book.year != null ? " - " + book.year.toString() : "";
    final fileExtension =
        book.fileExtension != null ? "." + book.fileExtension : "";
    return "$title$author$publisher$year$fileExtension";
  }

  @override
  Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
    if (event is DownloadBookEvent) {
      bool _permissionGranted = false;
      final _status = await Permission.storage.status;

      switch (_status) {
        case PermissionStatus.granted:
          _permissionGranted = true;
          break;
        case PermissionStatus.permanentlyDenied:
          yield DownloadPermissionsPermanentlyDenied();
          break;
        default:
          final status = await Permission.storage.request();
          _permissionGranted = status == PermissionStatus.granted;
          break;
      }

      if (_permissionGranted) {
        yield DownloadStarting();
        final _response = await bookRepository.getDownloadLink(event.book.md5);
        if (_response is http.Response) {
          if (_response.statusCode == 200) {
            final String _downloadLink = DownloadLinkModel.fromJson(
              jsonDecode(_response.body)['data'],
            ).downloadLink;
            Directory downloadsDirectory =
                await DownloadsPathProvider.downloadsDirectory;
            final String fileName = _generateFileName(event.book);
            downloadRepository.requestDownload(
              task: TaskInfo(name: fileName, link: _downloadLink),
              downloadPath: downloadsDirectory.path,
            );
            yield DownloadInProgress(message: "Download in progress");
          } else {
            yield DownloadError(
                error: "Download error. Try again later, please");
          }
        } else if (_response is String) {
          yield DownloadError(error: "Download error. Try again later, please");
        }
      }
    }
  }
}
