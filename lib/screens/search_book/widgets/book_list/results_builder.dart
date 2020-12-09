import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import 'package:libgen/blocs/book_bloc.dart';
import 'package:libgen/blocs/events/book_events.dart';
import 'package:libgen/blocs/states/book_states.dart';
import 'package:libgen/domain/book_model.dart';
import 'package:libgen/domain/filters_model.dart';
import 'package:libgen/domain/search_query_model.dart';
import 'package:libgen/screens/search_book/widgets/book_list_item/book_list_item.dart';
import 'package:libgen/generated/l10n.dart';

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
    int _totalCount = 0;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Center(
          child: BlocConsumer<BookBloc, BookState>(
            listener: (context, bookState) {
              if (bookState is BookLoadingState) {
                if (bookState.requiresCleaning) {
                  _books.clear();
                }
              } else if (bookState is BookNoMoreResults) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      S.of(context).resultsBuilderNoMoreResultsMessage,
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                );
              } else if (bookState is BookSuccessState) {
                _books.addAll(bookState.books);
                setState(() {
                  _totalCount = bookState.totalCount;
                });
                bookBloc.isFetching = false;
                Scaffold.of(context).hideCurrentSnackBar();
              } else if (bookState is BookErrorState && _books.isNotEmpty) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      S.of(context).resultsBuilderGenericErrorMessage,
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                );
                bookBloc.isFetching = false;
              }
            },
            builder: (context, bookState) {
              if (bookState is BookInitialState ||
                  bookState is BookLoadingState && _books.isEmpty) {
                return CircularProgressIndicator();
              } else if (bookState is BookErrorState && _books.isEmpty) {
                return _buildErrorMessage(
                  context,
                  S.of(context).resultsBuilderGenericErrorMessage,
                );
              } else if (bookState is BookNoResultsState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    S.of(context).resultsBuilderNoResultsForSearchTermMessage(
                          bookState.searchTerm.length > 50
                              ? '${bookState.searchTerm.substring(0, 50)}...'
                              : bookState.searchTerm,
                        ),
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return _buildResultsList(
                context: context,
                totalCount: _totalCount,
                bookState: bookState,
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildErrorMessage(BuildContext context, String errorMessage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          icon: Icon(
            Icons.refresh,
            size: 46,
            color: Theme.of(context).accentColor,
          ),
        ),
        SizedBox(height: 30),
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget _buildResultsList({
    BuildContext context,
    int totalCount,
    BookState bookState,
  }) {
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
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 20,
              bottom: 14,
            ),
            child: RichText(
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: "$totalCount",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                children: [
                  TextSpan(
                    text:
                        S.of(context).resultsBuilderTotalResultsCounterMessage,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontStyle: FontStyle.normal,
                        ),
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
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
      ],
    );
  }
}
