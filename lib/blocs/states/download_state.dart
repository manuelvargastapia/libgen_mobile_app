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

class DownloadInProgress extends DownloadState {
  final String message;
  const DownloadInProgress({@required this.message});
}

class DownloadError extends DownloadState {
  final String error;

  const DownloadError({@required this.error});
}
