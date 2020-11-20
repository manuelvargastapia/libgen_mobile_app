import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:libgen/domain/filters_extensions.dart';

import 'package:libgen/domain/search_query_model.dart';

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
    try {
      return await http.get(
        '$devURL/search?searchTerm=${searchQuery.searchTerm}&offset=${searchQuery.offset}&count=$count&searchIn=${searchQuery.filters.searchIn.displayAPILabel}&sortBy=${searchQuery.filters.sortBy.displayAPILabel}&reverse=${searchQuery.filters.reverseOrder}',
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
