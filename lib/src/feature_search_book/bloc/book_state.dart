import 'package:flutter/foundation.dart';
import 'package:libgen/src/feature_search_book/models/book_model.dart';

abstract class BookState {
  const BookState();
}

class BookInitialState extends BookState {
  const BookInitialState();
}

class BookLoadingState extends BookState {
  final String message;

  const BookLoadingState({@required this.message});
}

class BookSuccessState extends BookState {
  final List<BookModel> books;

  const BookSuccessState({@required this.books});
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
