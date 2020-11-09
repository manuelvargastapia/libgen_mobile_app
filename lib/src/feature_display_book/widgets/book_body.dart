import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_display_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_display_book/bloc/book_event.dart';
import 'package:libgen/src/feature_display_book/bloc/book_state.dart';
import 'package:libgen/src/feature_display_book/models/book_model.dart';
import 'package:libgen/src/feature_display_book/models/search_query_model.dart';
import 'package:libgen/src/feature_display_book/repository/book_repository.dart';

import 'book_list_item.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  String searchIn;
  String sortBy;

  @override
  void initState() {
    super.initState();
    searchIn = 'def';
    sortBy = 'def';
  }

  void updateSearchQuery(String newSearchIn, String newSortBy) {
    setState(() {
      searchIn = newSearchIn;
      sortBy = newSortBy;
    });
  }

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
                  delegate: BookSearchDelegate(
                    searchIn: searchIn,
                    sortBy: sortBy,
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                showFilterDialog(context, updateSearchQuery);
              },
            )
          ],
        )
      ],
    );
  }
}

Future<void> showFilterDialog(
  BuildContext context,
  void Function(String newSearchIn, String newSortBy) updateStateCallback,
) {
  Map<String, String> _sortByValues = {
    'def': 'Default',
    'title': 'Title',
    'publisher': 'Publisher',
    'year': 'Year',
    'pages': 'Pages',
    'language': 'Language',
    'filesize': 'File size',
    'extension': 'File extension',
  };

  Map<String, String> _searchInValues = {
    'def': 'Default',
    'title': 'Title',
    'author': 'Author',
    'series': 'Series',
    'publisher': 'Publisher',
    'year': 'Year',
    'identifier': 'ISBN',
    'md5': 'MD5',
    'extension': 'File extension'
  };

  String _sortBy = _sortByValues['def'];
  String _searchIn = _searchInValues['def'];

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Center(child: Text("Filter")),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 12, right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text("Sort by"),
                        ),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text("Sort by"),
                              items: _sortByValues.values
                                  .map(
                                    (String value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                              value: _sortBy,
                              onChanged: (String newValue) {
                                setState(() {
                                  _sortBy = newValue;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text('Search in'),
                        ),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text("Search in"),
                              items: _searchInValues.values
                                  .map(
                                    (String value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                              value: _searchIn,
                              onChanged: (String newValue) {
                                setState(() {
                                  _searchIn = newValue;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                        child: Text('Apply'),
                        onPressed: () {
                          String sortByKey = _sortByValues.keys.firstWhere(
                            (key) => _sortByValues[key] == _sortBy,
                            orElse: () => null,
                          );
                          String searchInKey = _searchInValues.keys.firstWhere(
                            (key) => _searchInValues[key] == _searchIn,
                            orElse: () => null,
                          );
                          updateStateCallback(searchInKey, sortByKey);
                        }),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class BookSearchDelegate extends SearchDelegate {
  final List<BookModel> _books = [];
  final ScrollController _scrollController = ScrollController();

  String searchIn;
  String sortBy;

  BookSearchDelegate({@required this.searchIn, @required this.sortBy});

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
        ..add(BookFetchEvent(SearchQueryModel(
          searchTerm: query,
          searchIn: this.searchIn,
          sortBy: this.sortBy,
        ))),
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
                        ..add(
                          BookFetchEvent(
                            SearchQueryModel(
                              searchTerm: query,
                              offset: _books.length,
                              searchIn: this.searchIn,
                              sortBy: this.sortBy,
                            ),
                          ),
                        );
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
                      ..add(
                        BookFetchEvent(
                          SearchQueryModel(
                            searchTerm: query,
                            offset: _books.length,
                            searchIn: this.searchIn,
                            sortBy: this.sortBy,
                          ),
                        ),
                      );
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
