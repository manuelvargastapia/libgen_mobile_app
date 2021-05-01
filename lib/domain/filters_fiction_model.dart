import 'package:equatable/equatable.dart';

import 'package:libgen/domain/filters_extensions.dart';
import 'package:libgen/domain/i_filters_model.dart';

class FiltersFictionModel extends Equatable implements FiltersModel {
  @override
  final SortBy sortBy;
  @override
  final SearchIn searchIn;

  final WildcardWords wildcardWords;
  final Language language;
  final Extension fileExtension;

  FiltersFictionModel({
    this.sortBy = SortBy.def,
    this.searchIn = SearchIn.def,
    this.wildcardWords = WildcardWords.no,
    this.language = Language.def,
    this.fileExtension = Extension.def,
  });

  @override
  List<Object> get props => [
        sortBy,
        searchIn,
        wildcardWords,
        language,
        fileExtension,
      ];
}
