import 'package:flutter/material.dart';

class SearchQueryModel {
  String searchTerm;
  String searchIn;
  String sortBy;
  int offset;

  SearchQueryModel({
    @required this.searchTerm,
    this.searchIn = 'def',
    this.sortBy = 'def',
    this.offset = 0,
  });
}
