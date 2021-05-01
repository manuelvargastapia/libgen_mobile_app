import 'package:flutter/foundation.dart';

import 'package:libgen/domain/i_book_model.dart';

abstract class BookState {
  const BookState();
}

class BookInitialState extends BookState {
  const BookInitialState();
}

class BookLoadingState extends BookState {
  final bool requiresCleaning;

  const BookLoadingState({this.requiresCleaning = false});
}

class BookSuccessState extends BookState {
  final List<BookModel> books;
  final int totalCount;

  const BookSuccessState({@required this.books, @required this.totalCount});
}

class BookNoResultsState extends BookState {
  final String searchTerm;

  const BookNoResultsState({@required this.searchTerm});
}

class BookNoMoreResults extends BookState {
  const BookNoMoreResults();
}

class BookErrorState extends BookState {
  const BookErrorState();
}

class BookConnectionFailed extends BookState {
  const BookConnectionFailed();
}
