import 'dart:io';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:libgen/src/models/downloadLink.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/rxdart.dart';

import '../models/result.dart';
import '../resources/repository.dart';

class BookBloc {
  final Repository _repository = Repository();
  final PublishSubject _booksFetcher = PublishSubject<Result>();

  Stream<Result> get books => _booksFetcher.stream;

  fetchBooks(String query) async {
    Result result = await _repository.searchBooks(query);
    _booksFetcher.sink.add(result);
  }

  downloadBook(String md5) async {
    await Permission.storage.request();
    DownloadLink downloadLink = await _repository.getDownloadLink(md5);
    Directory downloadsDirectory =
        await DownloadsPathProvider.downloadsDirectory;
    WidgetsFlutterBinding
        .ensureInitialized(); // Check FlutterDownloader initialization
    if (await Permission.storage.isGranted) {
      await FlutterDownloader.enqueue(
        url: downloadLink.url,
        savedDir: downloadsDirectory.path,
        showNotification: true,
        openFileFromNotification: true,
      );
    }
  }

  dispose() {
    _booksFetcher.close();
  }
}

final bookBloc = BookBloc();
