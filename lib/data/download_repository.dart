import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:dartz/dartz.dart';

class DownloadRepository {
  static final DownloadRepository _repository = DownloadRepository._();

  DownloadRepository._();

  factory DownloadRepository() {
    return _repository;
  }

  Future<Either<String, void>> requestDownload({
    @required String fileName,
    @required String downloadLink,
    @required String downloadPath,
  }) async {
    try {
      await FlutterDownloader.enqueue(
        url: downloadLink,
        savedDir: downloadPath,
        showNotification: true,
        openFileFromNotification: true,
        fileName: fileName,
      );
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, void>> cancelAllDownloads() async {
    try {
      await FlutterDownloader.cancelAll();
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}
