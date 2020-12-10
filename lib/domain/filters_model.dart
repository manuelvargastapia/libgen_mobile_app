import 'package:equatable/equatable.dart';

import 'package:libgen/domain/filters_extensions.dart';

class FiltersModel extends Equatable {
  final SortBy sortBy;
  final SearchIn searchIn;
  final ReverseOrder reverseOrder;

  FiltersModel({
    this.sortBy = SortBy.def,
    this.searchIn = SearchIn.def,
    this.reverseOrder = ReverseOrder.no,
  });

  @override
  List<Object> get props => [sortBy, searchIn, reverseOrder];
}
