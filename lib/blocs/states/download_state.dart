import 'package:flutter/material.dart';

class DownloadState {
  const DownloadState();
}

class DownloadInitialState extends DownloadState {
  const DownloadInitialState();
}

class DownloadStarting extends DownloadState {
  const DownloadStarting();
}

class FileNeedsToBeDownloadedFromBrowser extends DownloadState {
  final String url;
  const FileNeedsToBeDownloadedFromBrowser({@required this.url});
}

class DownloadError extends DownloadState {
  const DownloadError();
}

class DownloadPermissionsPermanentlyDenied extends DownloadState {
  const DownloadPermissionsPermanentlyDenied();
}

class DownloadConnectionFailed extends DownloadState {
  const DownloadConnectionFailed();
}
