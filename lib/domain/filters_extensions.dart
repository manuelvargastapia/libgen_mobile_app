import 'package:flutter/foundation.dart' show describeEnum;

enum SortBy { def, title, year, pages, fileSize }

enum SearchIn { def, title, author, series, publisher, isbn, md5 }

enum ReverseOrder { no, yes }

extension SortByExtension on SortBy {
  String get name => describeEnum(this);

  String get displayUILabel {
    switch (this) {
      case SortBy.def:
        return "Relevance";
        break;
      case SortBy.title:
        return "Title";
        break;
      case SortBy.year:
        return "Year";
        break;
      case SortBy.pages:
        return "Pages";
        break;
      case SortBy.fileSize:
        return "File size";
        break;
      default:
        return "Relevance";
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

  String displaySortingLabel(int index) {
    switch (this) {
      case SortBy.def:
        return "No ordering";
        break;
      case SortBy.title:
        return ["Ascending", "Descending"][index];
        break;
      case SortBy.year:
        return ["Older first", "Newer first"][index];
        break;
      case SortBy.pages:
        return ["Shorter first", "Larger first"][index];
        break;
      case SortBy.fileSize:
        return ["Smaller first", "Bigger first"][index];
        break;
      default:
        return "No ordering";
    }
  }
}

extension SearchInExtension on SearchIn {
  String get name => describeEnum(this);

  String get displayUILabel {
    switch (this) {
      case SearchIn.def:
        return "All";
        break;
      case SearchIn.title:
        return "Title";
        break;
      case SearchIn.author:
        return "Author";
        break;
      case SearchIn.series:
        return "Series";
        break;
      case SearchIn.publisher:
        return "Publisher";
        break;
      case SearchIn.isbn:
        return "ISBN";
        break;
      case SearchIn.md5:
        return "MD5";
        break;
      default:
        return "All";
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
