import 'package:equatable/equatable.dart';

import 'package:libgen/domain/filters_extensions.dart';
import 'package:libgen/domain/i_filters_model.dart';

class FiltersSciTechModel extends Equatable implements FiltersModel {
  @override
  final SortBy sortBy;
  @override
  final SearchIn searchIn;

  final ReverseOrder reverseOrder;

  FiltersSciTechModel({
    this.sortBy = SortBy.def,
    this.searchIn = SearchIn.def,
    this.reverseOrder = ReverseOrder.no,
  });

  @override
  List<Object> get props => [sortBy, searchIn, reverseOrder];
}
