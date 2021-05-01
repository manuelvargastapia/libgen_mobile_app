import 'package:equatable/equatable.dart';
import 'package:libgen/domain/filters_extensions.dart';

abstract class FiltersModel extends Equatable {
  final SortBy sortBy;
  final SearchIn searchIn;

  FiltersModel({
    this.sortBy = SortBy.def,
    this.searchIn = SearchIn.def,
  });
}
