import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_display_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_display_book/bloc/book_event.dart';
import 'package:libgen/src/feature_display_book/bloc/book_state.dart';
import 'package:libgen/src/feature_display_book/models/book_model.dart';
import 'package:libgen/src/feature_display_book/repository/book_repository.dart';

import 'book_list_item.dart';

class BookBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          title: Text('Lib Gen App'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: BookSearchDelegate(),
                );
              },
            )
          ],
        )
      ],
    );
  }
}

class BookSearchDelegate extends SearchDelegate {
  final List<BookModel> _books = [];
  final ScrollController _scrollController = ScrollController();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }

  @override
  Widget buildResults(BuildContext context) {
    _books.clear();

    if (query.length < 4) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than four letters.",
            ),
          )
        ],
      );
    }

    return BlocProvider(
      create: (context) => BookBloc(bookRepository: BookRepository())
        ..add(BookFetchEvent(currentOffset: 0, query: query)),
      child: Center(
        child: BlocConsumer<BookBloc, BookState>(
          listener: (context, bookState) {
            if (bookState is BookLoadingState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(bookState.message)));
            } else if (bookState is BookSuccessState &&
                bookState.books.isEmpty) {
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
                        ..add(BookFetchEvent(
                            currentOffset: _books.length, query: query));
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
                      ..add(BookFetchEvent(
                          currentOffset: _books.length, query: query));
                  }
                }),
              itemBuilder: (context, index) => BookListItem(_books[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: _books.length,
            );
          },
        ),
      ),
    );
  }
}
