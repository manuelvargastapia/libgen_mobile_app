import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart' show describeEnum;

import 'package:libgen/generated/l10n.dart';

enum SortBy { def, title, year, pages, fileSize }

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
