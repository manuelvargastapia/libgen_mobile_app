import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show describeEnum;

import 'package:libgen/generated/l10n.dart';

enum SearchIn { def, title, authors, series }

extension SearchInExtension on SearchIn {
  String get name => describeEnum(this);

  String displayUILabel(BuildContext context) {
    switch (this) {
      case SearchIn.def:
        return S.of(context).filtersExtensionsAll;
        break;
      case SearchIn.title:
        return S.of(context).filtersExtensionsTitle;
        break;
      case SearchIn.authors:
        return S.of(context).filtersExtensionsAuthor;
        break;
      case SearchIn.series:
        return S.of(context).filtersExtensionsSeries;
        break;
      default:
        return S.of(context).filtersExtensionsAll;
    }
  }

  String get displayAPILabel {
    switch (this) {
      case SearchIn.def:
        return "def";
        break;
      case SearchIn.title:
        return "title";
        break;
      case SearchIn.authors:
        return "authors";
        break;
      case SearchIn.series:
        return "series";
        break;
      default:
        return "def";
    }
  }
}
