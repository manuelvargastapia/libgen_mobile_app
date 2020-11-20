import 'package:libgen/domain/filters_extensions.dart';

class FiltersModel {
  SortBy sortBy;
  SearchIn searchIn;
  bool reverseOrder;

  FiltersModel({
    this.sortBy = SortBy.def,
    this.searchIn = SearchIn.def,
    this.reverseOrder = false,
  });
}
