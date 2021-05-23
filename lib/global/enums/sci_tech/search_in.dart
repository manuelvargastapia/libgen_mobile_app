import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show describeEnum;

import 'package:libgen/generated/l10n.dart';

enum SearchIn { def, title, author, series, publisher, isbn, md5 }

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
      case SearchIn.author:
        return S.of(context).filtersExtensionsAuthor;
        break;
      case SearchIn.series:
        return S.of(context).filtersExtensionsSeries;
        break;
      case SearchIn.publisher:
        return S.of(context).filtersExtensionsPublisher;
        break;
      case SearchIn.isbn:
        return S.of(context).filtersExtensionsISBN;
        break;
      case SearchIn.md5:
        return S.of(context).filtersExtensionsMD5;
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
      case SearchIn.author:
        return "author";
        break;
      case SearchIn.series:
        return "series";
        break;
      case SearchIn.publisher:
        return "publisher";
        break;
      case SearchIn.isbn:
        return "identifier";
        break;
      case SearchIn.md5:
        return "md5";
        break;
      default:
        return "def";
    }
  }
}
