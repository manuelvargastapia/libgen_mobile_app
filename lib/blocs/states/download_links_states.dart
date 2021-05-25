import 'package:flutter/foundation.dart';
import 'package:libgen/domain/download_link_model.dart';

abstract class DownloadLinksState {
  const DownloadLinksState();
}

class DownloadLinksInitialState extends DownloadLinksState {
  const DownloadLinksInitialState();
}

class DownloadLinksLoadingState extends DownloadLinksState {
  const DownloadLinksLoadingState();
}

class DownloadLinksSuccessState extends DownloadLinksState {
  final List<DownloadLinkModel> links;

  const DownloadLinksSuccessState({@required this.links});
}

class DownloadLinksErrorState extends DownloadLinksState {
  const DownloadLinksErrorState();
}

class DownloadLinksConnectionFailed extends DownloadLinksState {
  const DownloadLinksConnectionFailed();
}
