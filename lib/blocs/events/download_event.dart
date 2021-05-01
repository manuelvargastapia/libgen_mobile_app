import 'package:flutter/widgets.dart';
import 'package:libgen/domain/book_fiction_model.dart';

import 'package:libgen/domain/book_sci_tech_model.dart';
import 'package:libgen/domain/i_book_model.dart';

class DownloadEvent {
  final BookModel book;
  const DownloadEvent([this.book]);
}

class SciTechDownloadBookEvent extends DownloadEvent {
  final BookSciTechModel book;
  const SciTechDownloadBookEvent(this.book) : super(book);
}

class FictionDownloadBookEvent extends DownloadEvent {
  final BookFictionModel book;
  const FictionDownloadBookEvent(this.book) : super(book);
}

class DownloadFromBrowser extends DownloadEvent {
  final String url;
  const DownloadFromBrowser({@required this.url});
}
