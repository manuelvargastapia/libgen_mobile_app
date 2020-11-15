import 'package:flutter/material.dart';
import 'package:libgen/src/feature_search_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_search_book/models/filters_mode.dart';
import 'package:libgen/src/feature_search_book/widgets/book_list/results_builder.dart';

import 'show_filter_dialog.dart';

class BookSearchDelegate extends SearchDelegate {
  @override
  final String searchFieldLabel = "Title, author or ISBN";

  FiltersModel filters = FiltersModel();

  BookBloc bookBloc;

  BookSearchDelegate({@required this.bookBloc});

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
      IconButton(
        icon: Icon(Icons.filter_list),
        onPressed: () async {
          filters = await showFilterDialog(
            context: context,
            currentQuery: query,
            currentFilters: filters,
            bookBloc: bookBloc,
          );
        },
      )
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
    if (query.trim().length < 4) {
      return Container();
    }

    return ResultsBuilder(
      query: query,
      filters: filters,
      bookBloc: bookBloc,
    );
  }
}
