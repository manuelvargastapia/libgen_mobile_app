import 'package:libgen/domain/book_model.dart';

class DownloadEvent {
  const DownloadEvent();
}

class DownloadBookEvent extends DownloadEvent {
  final BookModel book;
  const DownloadBookEvent(this.book);
}
