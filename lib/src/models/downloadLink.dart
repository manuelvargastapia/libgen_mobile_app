class DownloadLink {
  String _url;

  DownloadLink.fromJson(Map<String, dynamic> json) {
    _url = json['data']['downloadLink'];
  }

  String get url => _url;
}
