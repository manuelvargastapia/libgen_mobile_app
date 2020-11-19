class DownloadEvent {
  const DownloadEvent();
}

class DownloadBookEvent extends DownloadEvent {
  final String md5;
  const DownloadBookEvent(this.md5);
}
