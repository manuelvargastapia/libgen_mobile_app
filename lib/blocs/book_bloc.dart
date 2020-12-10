import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:libgen/domain/book_model.dart';
import 'package:libgen/data/book_repository.dart';
import 'events/book_events.dart';
import 'states/book_states.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;
  bool isFetching = false;
  int _totalCount = 0;

  BookBloc({@required this.bookRepository}) : super(BookInitialState());

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is BookFetchEvent) {
      yield BookLoadingState(
        requiresCleaning: event.searchQuery.offset == 0,
      );
      if (event.searchQuery.offset > 0 &&
          event.searchQuery.offset >= _totalCount) {
        yield BookNoMoreResults();
      } else {
        final response = await bookRepository.getBooks(event.searchQuery);
        if (response is http.Response) {
          if (response.statusCode == 200) {
            final rawResponse = jsonDecode(response.body);
            final rawBooks = rawResponse['data'] as List;
            _totalCount = rawResponse['totalCount'] as int;
            final List<BookModel> books = [];
            rawBooks.forEach((book) {
              books.add(BookModel.fromJson(book));
            });
            yield BookSuccessState(books: books, totalCount: _totalCount);
          } else if (response.statusCode == 404) {
            yield BookNoResultsState(searchTerm: event.searchQuery.searchTerm);
          } else {
            yield BookErrorState();
          }
        } else if (response is SocketException) {
          yield BookConnectionFailed();
        } else {
          yield BookErrorState();
        }
      }
    }
  }
}
