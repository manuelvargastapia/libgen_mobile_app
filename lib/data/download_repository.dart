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

  // void delete(TaskInfo task) async {
  //   await FlutterDownloader.remove(
  //     taskId: task.taskId,
  //     shouldDeleteContent: true,
  //   );
  //   await _prepare();
  //   setState(() {});
  // }

  // Future<Null> _prepare() async {
  //   final tasks = await FlutterDownloader.loadTasks();

  //   int count = 0;
  //   _tasks = [];
  //   _items = [];

  //   _tasks.addAll(_documents.map((document) =>
  //       TaskInfo(name: document['name'], link: document['link'])));

  //   _items.add(_ItemHolder(name: 'Documents'));
  //   for (int i = count; i < _tasks.length; i++) {
  //     _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
  //     count++;
  //   }

  //   _tasks.addAll(_images
  //       .map((image) => TaskInfo(name: image['name'], link: image['link'])));

  //   _items.add(_ItemHolder(name: 'Images'));
  //   for (int i = count; i < _tasks.length; i++) {
  //     _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
  //     count++;
  //   }

  //   _tasks.addAll(_videos
  //       .map((video) => TaskInfo(name: video['name'], link: video['link'])));

  //   _items.add(_ItemHolder(name: 'Videos'));
  //   for (int i = count; i < _tasks.length; i++) {
  //     _items.add(_ItemHolder(name: _tasks[i].name, task: _tasks[i]));
  //     count++;
  //   }

  //   tasks?.forEach((task) {
  //     for (TaskInfo info in _tasks) {
  //       if (info.link == task.url) {
  //         info.taskId = task.taskId;
  //         info.status = task.status;
  //         info.progress = task.progress;
  //       }
  //     }
  //   });

  //   final savedDir = Directory(downloadPath);
  //   bool hasExisted = await savedDir.exists();
  //   if (!hasExisted) {
  //     savedDir.create();
  //   }
  // }

}
