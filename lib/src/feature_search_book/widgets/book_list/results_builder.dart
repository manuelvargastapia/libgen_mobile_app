import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_search_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_search_book/bloc/book_event.dart';
import 'package:libgen/src/feature_search_book/bloc/book_state.dart';
import 'package:libgen/src/feature_search_book/models/book_model.dart';
import 'package:libgen/src/feature_search_book/models/filters_model.dart';
import 'package:libgen/src/feature_search_book/models/search_query_model.dart';
import 'package:libgen/src/feature_search_book/widgets/book_list_item/book_list_item.dart';

import 'dart:math' as math;

class ResultsBuilder extends StatelessWidget {
  final String query;
  final FiltersModel filters;
  final BookBloc bookBloc;
  final List<BookModel> _books = [];
  int _totalCount = 0;
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
            if (bookState.requiresCleaning) {
              _books.clear();
            }
          } else if (bookState is BookNoMoreResults) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('No more results')),
            );
          } else if (bookState is BookSuccessState) {
            _books.addAll(bookState.books);
            _totalCount = bookState.totalCount;
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
          } else if (bookState is BookNoResultsState) {
            return Text(bookState.message);
          }
          return CustomScrollView(
            semanticChildCount: _books.length,
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
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 20, bottom: 14),
                  child: RichText(
                    text: TextSpan(
                      text: "$_totalCount",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: " results",
                          style: DefaultTextStyle.of(context).style,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => index.isEven
                      ? BookListItem(_books[index ~/ 2])
                      : Divider(
                          height: 30,
                          indent: 20,
                          endIndent: 20,
                        ),
                  semanticIndexCallback: (widget, localIndex) =>
                      localIndex.isEven ? localIndex ~/ 2 : null,
                  childCount: math.max(0, _books.length * 2 - 1),
                ),
              ),
              if (bookState is BookLoadingState && _books.isNotEmpty)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
