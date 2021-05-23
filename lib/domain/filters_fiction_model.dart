import 'package:equatable/equatable.dart';

import 'package:libgen/domain/fiction_filters_extensions.dart';
import 'package:libgen/domain/i_filters_model.dart';

class FiltersFictionModel extends Equatable implements FiltersModel {
  final SearchIn searchIn;
  final WildcardWords wildcardWords;
  final String language;
  final Extension fileExtension;

  FiltersFictionModel({
    this.searchIn = SearchIn.def,
    this.wildcardWords = WildcardWords.no,
    this.language = 'def',
    this.fileExtension = Extension.def,
  });

  @override
  List<Object> get props => [
        searchIn,
        wildcardWords,
        language,
        fileExtension,
      ];
}
