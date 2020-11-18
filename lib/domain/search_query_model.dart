import 'package:flutter/material.dart';

import 'filters_model.dart';

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
