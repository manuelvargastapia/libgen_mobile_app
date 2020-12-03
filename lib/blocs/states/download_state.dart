import 'package:flutter/material.dart';

class DownloadState {
  const DownloadState();
}

class DownloadInitialState extends DownloadState {
  const DownloadInitialState();
}

class DownloadStarting extends DownloadState {
  final String message;
  const DownloadStarting({@required this.message});
}

class DownloadInProgress extends DownloadState {
  final String message;
  const DownloadInProgress({@required this.message});
}

class FileNeedsToBeDownloadedFromBrowser extends DownloadState {
  final String url;
  const FileNeedsToBeDownloadedFromBrowser({@required this.url});
}

class DownloadError extends DownloadState {
  final String error;

  const DownloadError({@required this.error});
}

class DownloadPermissionsPermanentlyDenied extends DownloadState {
  const DownloadPermissionsPermanentlyDenied();
}
