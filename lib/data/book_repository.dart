import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:libgen/domain/sci_tech_filters_extensions.dart';
import 'package:libgen/domain/fiction_filters_extensions.dart';
import 'package:libgen/domain/filters_fiction_model.dart';
import 'package:libgen/domain/filters_sci_tech_model.dart';
import 'package:libgen/domain/search_query_model.dart';
import 'package:libgen/global/environment/environment_config.dart';

const int count = 10;
final Uri _apiURL = Uri.parse(EnvironmentConfig.libgenApiURL);

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
        Uri(
          scheme: _apiURL.scheme,
          host: _apiURL.host,
          port: _apiURL.port,
          path: '/search',
          queryParameters: {
            'searchTerm': searchQuery.searchTerm,
            'offset': searchQuery.offset.toString(),
            'count': count.toString(),
            'searchIn': sciTechFilters.searchIn.displayAPILabel,
            'sortBy': sciTechFilters.sortBy.displayAPILabel,
            'reverse': sciTechFilters.reverseOrder.value.toString(),
          },
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
        Uri(
          scheme: _apiURL.scheme,
          host: _apiURL.host,
          port: _apiURL.port,
          path: '/search/fiction',
          queryParameters: {
            'searchTerm': searchQuery.searchTerm,
            'offset': searchQuery.offset.toString(),
            'count': count.toString(),
            'searchIn': fictionFilters.searchIn.displayAPILabel,
            'wildcardWords': fictionFilters.wildcardWords.value.toString(),
            'language': fictionFilters.language,
            'extension': fictionFilters.fileExtension.displayAPILabel,
          },
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
      return await http.get(
        Uri(
          scheme: _apiURL.scheme,
          host: _apiURL.host,
          port: _apiURL.port,
          path: '/download',
          queryParameters: downloadPageURL != null
              ? {
                  'downloadPageURL': downloadPageURL,
                }
              : {'md5': md5},
        ),
      );
    } catch (e) {
      return e;
    }
  }
}
