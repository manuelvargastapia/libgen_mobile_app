import 'package:libgen/domain/search_query_model.dart';

abstract class BookEvent {
  const BookEvent();
}

class BookFetchSciTechEvent extends BookEvent {
  final SearchQueryModel searchQuery;
  const BookFetchSciTechEvent(this.searchQuery);
}

class BookFetchFictionEvent extends BookEvent {
  final SearchQueryModel searchQuery;
  const BookFetchFictionEvent(this.searchQuery);
}
