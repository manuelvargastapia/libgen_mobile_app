import 'dart:async';

import 'package:http/http.dart' as http;

const String prodURL = 'https://polar-temple-33235.herokuapp.com';
const String devURL = 'http://10.0.2.2:8000';

class BookDetailsRepository {
  static final BookDetailsRepository _repository = BookDetailsRepository._();

  BookDetailsRepository._();

  factory BookDetailsRepository() {
    return _repository;
  }

  Future<dynamic> getBookDetails(int bookId) async {
    try {
      return await http.get('$devURL/details?id=$bookId');
    } catch (e) {
      return e.toString();
    }
  }
}
