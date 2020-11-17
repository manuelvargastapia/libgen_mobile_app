import 'package:flutter/foundation.dart';
import 'package:libgen/src/feature_search_book/models/book_model.dart';

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
  final String message;

  const BookNoResultsState({@required this.message});
}

class BookNoMoreResults extends BookState {
  final String message;

  const BookNoMoreResults({@required this.message});
}

class BookErrorState extends BookState {
  final String error;

  const BookErrorState({@required this.error});
}

class DownloadInProgress extends BookState {
  final String message;

  const DownloadInProgress({@required this.message});
}

class DownloadSuccessful extends BookState {
  final String message;

  const DownloadSuccessful({@required this.message});
}

class DownloadError extends BookState {
  final String error;

  const DownloadError({@required this.error});
}
