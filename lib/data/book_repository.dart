import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:libgen/domain/filters_extensions.dart';
import 'package:libgen/domain/search_query_model.dart';

const String prodURL = 'https://libgen-mobile-api.herokuapp.com';
const String devURLEmulator = 'http://10.0.2.2:3000';
const String devURLPhysical = 'http://192.168.0.14:3000';
const int count = 10;

class BookRepository {
  static final BookRepository _bookRepository = BookRepository._();

  BookRepository._();

  factory BookRepository() {
    return _bookRepository;
  }

  http.Response _cachedResponse;
  SearchQueryModel _cachedQuery;

  Future<dynamic> getBooks(SearchQueryModel searchQuery) async {
    try {
      if (_cachedQuery == searchQuery && _cachedResponse.statusCode == 200) {
        return _cachedResponse;
      }
      final response = await http.get(
        '$devURLEmulator/search?searchTerm=${searchQuery.searchTerm}&offset=${searchQuery.offset}&count=$count&searchIn=${searchQuery.filters.searchIn.displayAPILabel}&sortBy=${searchQuery.filters.sortBy.displayAPILabel}&reverse=${searchQuery.filters.reverseOrder}',
      );
      if (_cachedQuery != searchQuery) {
        _cachedQuery = searchQuery;
        _cachedResponse = response;
        return _cachedResponse;
      }
      return response;
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> getDownloadLink(String md5) async {
    try {
      return await http.get('$devURLEmulator/download?md5=$md5');
    } catch (e) {
      return e.toString();
    }
  }
}
