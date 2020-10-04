import 'book.dart';

class Result {
  List<Book> _bookList = [];

  Result.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) => _bookList.add(Book.fromJson(element)));
  }

  List<Book> get bookList => _bookList;
}
