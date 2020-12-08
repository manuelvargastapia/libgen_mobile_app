import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show describeEnum;

import 'package:libgen/generated/l10n.dart';

enum SortBy { def, title, year, pages, fileSize }

enum SearchIn { def, title, author, series, publisher, isbn, md5 }

enum ReverseOrder { no, yes }

extension SortByExtension on SortBy {
  String get name => describeEnum(this);

  String displayUILabel(BuildContext context) {
    switch (this) {
      case SortBy.def:
        return S.of(context).filtersExtensionsRelevance;
        break;
      case SortBy.title:
        return S.of(context).filtersExtensionsTitle;
        break;
      case SortBy.year:
        return S.of(context).filtersExtensionsYear;
        break;
      case SortBy.pages:
        return S.of(context).filtersExtensionsPages;
        break;
      case SortBy.fileSize:
        return S.of(context).filtersExtensionsFileSize;
        break;
      default:
        return S.of(context).filtersExtensionsRelevance;
    }
  }

  String get displayAPILabel {
    switch (this) {
      case SortBy.def:
        return "def";
        break;
      case SortBy.title:
        return "title";
        break;
      case SortBy.year:
        return "year";
        break;
      case SortBy.pages:
        return "pages";
        break;
      case SortBy.fileSize:
        return "filesize";
        break;
      default:
        return "def";
    }
  }

  String displaySortingLabel(BuildContext context, int index) {
    switch (this) {
      case SortBy.def:
        return null;
        break;
      case SortBy.title:
        return [
          S.of(context).filtersExtensionsAscending,
          S.of(context).filtersExtensionsDescending
        ][index];
        break;
      case SortBy.year:
        return [
          S.of(context).filtersExtensionsOlderFirst,
          S.of(context).filtersExtensionsNewerFirst
        ][index];
        break;
      case SortBy.pages:
        return [
          S.of(context).filtersExtensionsShorterFirst,
          S.of(context).filtersExtensionsLargerFirst
        ][index];
        break;
      case SortBy.fileSize:
        return [
          S.of(context).filtersExtensionsSmallerFirst,
          S.of(context).filtersExtensionsBiggerFirst
        ][index];
        break;
      default:
        return null;
    }
  }
}

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

extension ReverseOrderExtension on ReverseOrder {
  String get name => describeEnum(this);

  bool get value {
    return this == ReverseOrder.yes;
  }
}
