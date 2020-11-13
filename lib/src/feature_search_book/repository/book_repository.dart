import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:libgen/src/feature_search_book/models/search_query_model.dart';

const String prodURL = 'https://polar-temple-33235.herokuapp.com';
const String devURL = 'http://10.0.2.2:8000';
const int count = 10;

class BookRepository {
  static final BookRepository _bookRepository = BookRepository._();

  BookRepository._();

  factory BookRepository() {
    return _bookRepository;
  }

  Future<dynamic> getBooks(SearchQueryModel searchQuery) async {
    print(
        '${searchQuery.offset}, ${searchQuery.searchIn}, ${searchQuery.searchTerm}, ${searchQuery.sortBy}');
    try {
      return await http.get(
        '$devURL/search?searchTerm=${searchQuery.searchTerm}&offset=${searchQuery.offset}&count=$count&searchIn=${searchQuery.searchIn}&sortBy=${searchQuery.sortBy}',
      );
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getDownloadLink(String md5) async {
    try {
      return await http.get('$devURL/download?md5=$md5');
    } catch (e) {
      return e.toString();
    }
  }
}
