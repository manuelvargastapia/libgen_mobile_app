import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_display_book/blocs/bloc/book_bloc.dart';
import 'package:libgen/src/feature_display_book/blocs/bloc/book_event.dart';
import 'package:libgen/src/feature_display_book/blocs/bloc/book_state.dart';
import 'package:libgen/src/feature_display_book/blocs/models/book_model.dart';

import 'book_list_item.dart';

class BookBody extends StatelessWidget {
  final List<BookModel> _books = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<BookBloc, BookState>(
        listener: (context, bookState) {
          if (bookState is BookLoadingState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(bookState.message)));
          } else if (bookState is BookSuccessState && bookState.books.isEmpty) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('No more books')));
          } else if (bookState is BookErrorState) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(bookState.error)));
            context.bloc<BookBloc>().isFetching = false;
          }
          return;
        },
        builder: (context, bookState) {
          if (bookState is BookInitialState ||
              bookState is BookLoadingState && _books.isEmpty) {
            return CircularProgressIndicator();
          } else if (bookState is BookSuccessState) {
            _books.addAll(bookState.books);
            context.bloc<BookBloc>().isFetching = false;
            Scaffold.of(context).hideCurrentSnackBar();
          } else if (bookState is BookErrorState && _books.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    context.bloc<BookBloc>()
                      ..isFetching = true
                      ..add(BookFetchEvent(_books.length));
                  },
                  icon: Icon(Icons.refresh),
                ),
                const SizedBox(height: 15),
                Text(bookState.error, textAlign: TextAlign.center),
              ],
            );
          }
          return ListView.separated(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                          _scrollController.position.maxScrollExtent &&
                      !context.bloc<BookBloc>().isFetching) {
                    context.bloc<BookBloc>()
                      ..isFetching = true
                      ..add(BookFetchEvent(_books.length));
                  }
                }),
              itemBuilder: (context, index) => BookListItem(_books[index]),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
              itemCount: _books.length);
        },
      ),
    );
  }
}
