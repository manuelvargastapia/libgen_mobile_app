abstract class DownloadLinksEvent {
  const DownloadLinksEvent();
}

class DownloadLinksFetchEvent extends DownloadLinksEvent {
  final String md5;
  final String downloadPageURL;
  DownloadLinksFetchEvent({this.md5, this.downloadPageURL});
}
