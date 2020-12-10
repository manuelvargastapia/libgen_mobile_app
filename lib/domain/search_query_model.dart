import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

import 'filters_model.dart';

class SearchQueryModel extends Equatable {
  final String searchTerm;
  final FiltersModel filters;
  final int offset;

  SearchQueryModel({
    @required this.searchTerm,
    @required this.filters,
    this.offset = 0,
  });

  @override
  List<Object> get props => [searchTerm, filters, offset];
}
