import 'package:flutter/widgets.dart';
import 'package:libgen/domain/book_fiction_model.dart';
import 'package:libgen/domain/book_sci_tech_model.dart';
import 'package:libgen/domain/i_book_model.dart';

class DownloadEvent {
  final BookModel book;
  final String downloadLink;
  const DownloadEvent([this.book, this.downloadLink]);
}

class SciTechDownloadBookEvent extends DownloadEvent {
  final BookSciTechModel book;
  final String downloadLink;
  const SciTechDownloadBookEvent(this.book, this.downloadLink)
      : super(book, downloadLink);
}

class FictionDownloadBookEvent extends DownloadEvent {
  final BookFictionModel book;
  final String downloadLink;
  const FictionDownloadBookEvent(this.book, this.downloadLink)
      : super(book, downloadLink);
}

class DownloadFromBrowser extends DownloadEvent {
  final String url;
  const DownloadFromBrowser({@required this.url});
}
