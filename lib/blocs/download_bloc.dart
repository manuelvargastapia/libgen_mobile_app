import 'dart:convert';
import 'dart:io';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import 'package:libgen/blocs/events/download_event.dart';
import 'package:libgen/blocs/states/download_state.dart';
import 'package:libgen/data/book_repository.dart';
import 'package:libgen/domain/download_link_model.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  final BookRepository bookRepository;
  bool isDownloading = false;

  DownloadBloc({@required this.bookRepository}) : super(DownloadInitialState());

  @override
  Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
    if (event is DownloadBookEvent) {
      yield DownloadStarting();
      final _response = await bookRepository.getDownloadLink(event.md5);
      if (_response is http.Response) {
        if (_response.statusCode == 200) {
          final String _downloadLink = DownloadLinkModel.fromJson(
            jsonDecode(_response.body)['data'],
          ).downloadLink;
          await Permission.storage.request();
          Directory downloadsDirectory =
              await DownloadsPathProvider.downloadsDirectory;
          if (await Permission.storage.isGranted) {
            yield DownloadInProgress(message: "Download in progress");
            await FlutterDownloader.enqueue(
              url: _downloadLink,
              savedDir: downloadsDirectory.path,
              showNotification: true,
              openFileFromNotification: true,
            );
          }
        } else {
          yield DownloadError(error: "Download error. Try again later, please");
        }
      } else if (_response is String) {
        yield DownloadError(error: "Download error. Try again later, please");
      }
    }
  }
}
