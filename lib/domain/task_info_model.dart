import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

class TaskInfo {
  final String name;
  final String link;
  String taskId;
  int progress = 0;
  DownloadTaskStatus status = DownloadTaskStatus.undefined;

  TaskInfo({@required this.name, @required this.link});
}
