import 'package:libgen/domain/search_query_model.dart';

abstract class BookEvent {
  const BookEvent();
}

class BookFetchEvent extends BookEvent {
  final SearchQueryModel searchQuery;
  const BookFetchEvent(this.searchQuery);
}
