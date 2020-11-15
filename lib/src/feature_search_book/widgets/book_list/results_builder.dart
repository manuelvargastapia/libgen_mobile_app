import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_search_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_search_book/bloc/book_event.dart';
import 'package:libgen/src/feature_search_book/bloc/book_state.dart';
import 'package:libgen/src/feature_search_book/models/book_model.dart';
import 'package:libgen/src/feature_search_book/models/filters_model.dart';
import 'package:libgen/src/feature_search_book/models/search_query_model.dart';
import 'package:libgen/src/feature_search_book/widgets/book_list_item/book_list_item.dart';

class ResultsBuilder extends StatelessWidget {
  final String query;
  final FiltersModel filters;
  final BookBloc bookBloc;
  final List<BookModel> _books = [];
  final ScrollController _scrollController = ScrollController();

  ResultsBuilder({
    @required this.query,
    @required this.filters,
    @required this.bookBloc,
  });

  @override
  Widget build(BuildContext context) {
    bookBloc.add(BookFetchEvent(
      SearchQueryModel(searchTerm: query, filters: this.filters),
    ));

    return Center(
      child: BlocConsumer<BookBloc, BookState>(
        listener: (context, bookState) {
          if (bookState is BookLoadingState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(bookState.message)),
            );
            if (bookState.requiresCleaning) {
              _books.clear();
            }
          } else if (bookState is BookSuccessState && bookState.books.isEmpty) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('No more books')),
            );
          } else if (bookState is BookSuccessState) {
            _books.addAll(bookState.books);
            bookBloc.isFetching = false;
            Scaffold.of(context).hideCurrentSnackBar();
          } else if (bookState is BookErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(bookState.error)),
            );
            bookBloc.isFetching = false;
          }
        },
        builder: (context, bookState) {
          if (bookState is BookInitialState ||
              bookState is BookLoadingState && _books.isEmpty) {
            return CircularProgressIndicator();
          } else if (bookState is BookErrorState && _books.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    bookBloc
                      ..isFetching = true
                      ..add(
                        BookFetchEvent(
                          SearchQueryModel(
                            searchTerm: query,
                            offset: _books.length,
                            filters: this.filters,
                          ),
                        ),
                      );
                  },
                  icon: Icon(Icons.refresh),
                ),
                SizedBox(height: 15),
                Text(bookState.error, textAlign: TextAlign.center),
              ],
            );
          }
          return ListView.separated(
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                        _scrollController.position.maxScrollExtent &&
                    !bookBloc.isFetching) {
                  bookBloc
                    ..isFetching = true
                    ..add(
                      BookFetchEvent(
                        SearchQueryModel(
                          searchTerm: query,
                          offset: _books.length,
                          filters: this.filters,
                        ),
                      ),
                    );
                }
              }),
            itemBuilder: (context, index) => BookListItem(_books[index]),
            separatorBuilder: (context, index) => Divider(
              height: 30,
              indent: 20,
              endIndent: 20,
            ),
            itemCount: _books.length,
          );
        },
      ),
    );
  }
}
