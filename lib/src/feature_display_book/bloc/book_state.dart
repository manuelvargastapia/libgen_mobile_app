import 'package:flutter/foundation.dart';
import 'package:libgen/src/feature_display_book/models/book_model.dart';

abstract class BookState {
  final String md5;
  const BookState({this.md5});
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
  final String md5;

  const DownloadInProgress({@required this.message, @required this.md5});
}

class DownloadSuccessful extends BookState {
  final String message;
  final String md5;

  const DownloadSuccessful({@required this.message, @required this.md5});
}

class DownloadError extends BookState {
  final String error;
  final String md5;

  const DownloadError({@required this.error, @required this.md5});
}
