import 'package:equatable/equatable.dart';
import 'package:libgen/domain/i_filters_model.dart';

import 'package:libgen/domain/sci_tech_filters_extensions.dart';

class FiltersSciTechModel extends Equatable implements FiltersModel {
  final SortBy sortBy;
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
