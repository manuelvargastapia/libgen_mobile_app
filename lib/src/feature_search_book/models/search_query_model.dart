import 'package:flutter/material.dart';
import 'package:libgen/src/feature_search_book/models/filters_model.dart';

class SearchQueryModel {
  String searchTerm;
  FiltersModel filters;
  int offset;

  SearchQueryModel({
    @required this.searchTerm,
    @required this.filters,
    this.offset = 0,
  });
}
