import 'package:libgen/src/domain/search_query_model.dart';

abstract class BookEvent {
  const BookEvent();
}

class BookFetchEvent extends BookEvent {
  final SearchQueryModel searchQuery;
  const BookFetchEvent(this.searchQuery);
}

class DownloadBookEvent extends BookEvent {
  final String md5;
  const DownloadBookEvent(this.md5);
}
