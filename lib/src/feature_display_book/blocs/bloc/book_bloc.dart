import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:libgen/src/feature_display_book/blocs/bloc/book_event.dart';
import 'package:libgen/src/feature_display_book/blocs/bloc/book_state.dart';
import 'package:libgen/src/feature_display_book/blocs/models/book_model.dart';
import 'package:libgen/src/feature_display_book/blocs/repository/book_repository.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;
  bool isFetching = false;

  BookBloc({@required this.bookRepository}) : super(BookInitialState());

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is BookFetchEvent) {
      yield BookLoadingState(message: 'Loading books');
      final response = await bookRepository.getBooks(
        searchQuery: 'philosophy',
        offset: event.currentOffset,
      );
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final rawBooks = jsonDecode(response.body)['data'] as List;
          final List<BookModel> books = [];
          rawBooks.forEach((book) {
            books.add(BookModel.fromJson(book));
          });
          yield BookSuccessState(books: books);
        } else {
          yield BookErrorState(error: response.body);
        }
      } else if (response is String) {
        yield BookErrorState(error: response);
      }
    }
  }
}
