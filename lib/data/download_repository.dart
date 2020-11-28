import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

import 'package:libgen/domain/task_info_model.dart';

class DownloadRepository {
  static final DownloadRepository _repository = DownloadRepository._();

  DownloadRepository._();

  factory DownloadRepository() {
    return _repository;
  }

  Future<void> requestDownload({
    @required TaskInfo task,
    @required String downloadPath,
  }) async {
    task.taskId = await FlutterDownloader.enqueue(
      url: task.link,
      savedDir: downloadPath,
      showNotification: true,
      openFileFromNotification: true,
      fileName: task.name,
    );
  }

  void cancelDownload(TaskInfo task) async {
    await FlutterDownloader.cancel(taskId: task.taskId);
  }

  void pauseDownload(TaskInfo task) async {
    await FlutterDownloader.pause(taskId: task.taskId);
  }

  void resumeDownload(TaskInfo task) async {
    String newTaskId = await FlutterDownloader.resume(taskId: task.taskId);
    task.taskId = newTaskId;
  }

  void retryDownload(TaskInfo task) async {
    String newTaskId = await FlutterDownloader.retry(taskId: task.taskId);
    task.taskId = newTaskId;
  }

  Future<bool> openDownloadedFile(TaskInfo task) {
    return FlutterDownloader.open(taskId: task.taskId);
  }

  Future<void> delete(TaskInfo task) async {
    await FlutterDownloader.remove(
      taskId: task.taskId,
      shouldDeleteContent: true,
    );
  }
}
