import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:libgen/domain/filters_extensions.dart';
import 'package:libgen/domain/search_query_model.dart';
import 'package:libgen/global/environment/environment_config.dart';

const String _apiURL = EnvironmentConfig.libgenApiURL;
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
        '$_apiURL/search?searchTerm=${searchQuery.searchTerm}&offset=${searchQuery.offset}&count=$count&searchIn=${searchQuery.filters.searchIn.displayAPILabel}&sortBy=${searchQuery.filters.sortBy.displayAPILabel}&reverse=${searchQuery.filters.reverseOrder.value}',
      );
      if (_cachedQuery != searchQuery) {
        _cachedQuery = searchQuery;
        _cachedResponse = response;
        return _cachedResponse;
      }
      return response;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getDownloadLink(String md5) async {
    try {
      return await http.get('$_apiURL/download?md5=$md5');
    } catch (e) {
      return e;
    }
  }
}
