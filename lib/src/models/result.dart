class Result {
  List<_Book> _bookList = [];

  Result.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) => _bookList.add(_Book.fromJson(element)));
  }

  List<_Book> get bookList => _bookList;
}

class _Book {
  String _title;
  String _author;
  String _year;
  String _md5;

  _Book.fromJson(Map<String, dynamic> json) {
    _title = json['title'];
    _author = json['author'];
    _year = json['year'];
    _md5 = json['md5'];
  }

  String get title => _title;
  String get author => _author;
  String get year => _year;
  String get md5 => _md5;
}
