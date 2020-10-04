class Book {
  String _title;
  String _author;
  String _year;
  String _md5;

  Book.fromJson(Map<String, dynamic> json) {
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
