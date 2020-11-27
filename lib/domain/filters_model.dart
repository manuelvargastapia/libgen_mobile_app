import 'package:equatable/equatable.dart';

import 'package:libgen/domain/filters_extensions.dart';

class FiltersModel extends Equatable {
  final SortBy sortBy;
  final SearchIn searchIn;
  final bool reverseOrder;

  FiltersModel({
    this.sortBy = SortBy.def,
    this.searchIn = SearchIn.def,
    this.reverseOrder = false,
  });

  @override
  List<Object> get props => [sortBy, searchIn, reverseOrder];
}
