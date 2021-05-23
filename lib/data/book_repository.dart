import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:libgen/domain/sci_tech_filters_extensions.dart';
import 'package:libgen/domain/fiction_filters_extensions.dart';
import 'package:libgen/domain/filters_fiction_model.dart';
import 'package:libgen/domain/filters_sci_tech_model.dart';
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

  Future<dynamic> getSciTechBooks(SearchQueryModel searchQuery) async {
    try {
      if (_cachedQuery == searchQuery && _cachedResponse.statusCode == 200) {
        return _cachedResponse;
      }
      final sciTechFilters = searchQuery.filters as FiltersSciTechModel;
      final response = await http.get(
        Uri.parse(
          '$_apiURL/search?searchTerm=${searchQuery.searchTerm}&offset=${searchQuery.offset}&count=$count&searchIn=${sciTechFilters.searchIn.displayAPILabel}&sortBy=${sciTechFilters.sortBy.displayAPILabel}&reverse=${sciTechFilters.reverseOrder.value}',
        ),
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

  Future<dynamic> getFictionBooks(SearchQueryModel searchQuery) async {
    try {
      if (_cachedQuery == searchQuery && _cachedResponse.statusCode == 200) {
        return _cachedResponse;
      }
      final fictionFilters = searchQuery.filters as FiltersFictionModel;
      final response = await http.get(
        Uri.parse(
          '$_apiURL/search/fiction?searchTerm=${searchQuery.searchTerm}&count=$count&searchIn=${fictionFilters.searchIn.displayAPILabel}&offset=${searchQuery.offset}&wildcardWords=${fictionFilters.wildcardWords.value}&language=${fictionFilters.language}&extension=${fictionFilters.fileExtension.displayAPILabel}',
        ),
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

  Future<dynamic> getDownloadLink({String md5, String downloadPageURL}) async {
    try {
      if (downloadPageURL != null) {
        return await http.get(
          Uri.parse('$_apiURL/download?downloadPageURL=$downloadPageURL'),
        );
      } else {
        return await http.get(Uri.parse('$_apiURL/download?md5=$md5'));
      }
    } catch (e) {
      return e;
    }
  }
}
