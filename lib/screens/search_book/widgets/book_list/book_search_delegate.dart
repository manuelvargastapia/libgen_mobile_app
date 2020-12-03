import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/book_bloc.dart';
import 'package:libgen/blocs/events/book_events.dart';
import 'package:libgen/blocs/events/hive_event.dart';
import 'package:libgen/blocs/hive_bloc.dart';
import 'package:libgen/blocs/states/hive_state.dart';
import 'package:libgen/domain/filters_model.dart';
import 'package:libgen/domain/search_query_model.dart';
import 'package:libgen/domain/suggestion.dart';
import 'package:libgen/screens/search_book/widgets/book_list/suggestions_builder.dart';
import 'results_builder.dart';
import 'show_filter_dialog.dart';

class BookSearchDelegate extends SearchDelegate {
  @override
  final String searchFieldLabel = "Title, author or ISBN";

  FiltersModel filters = FiltersModel();

  BookBloc bookBloc;
  HiveBloc<Suggestion> hiveBloc;

  BookSearchDelegate({@required this.bookBloc, @required this.hiveBloc});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          size: 20,
        ),
        onPressed: () {
          query = '';
        },
      ),
      IconButton(
        icon: Icon(Icons.tune),
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
      icon: Icon(
        Icons.arrow_back,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    hiveBloc.add(LoadAllEvent<Suggestion>());

    return BlocBuilder<HiveBloc<Suggestion>, HiveState>(
      builder: (context, hiveState) {
        if (hiveState is HiveSuccessState && hiveState.data != null) {
          return SuggestionsBuilder(
            hiveBloc: hiveBloc,
            onSelected: (Suggestion suggestion) {
              query = suggestion.query;
              showResults(context);
            },
            suggestions: hiveState.data as List<Suggestion>,
          );
        }
        return Column();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().length < 4) {
      return Container();
    }

    hiveBloc.add(CacheDataEvent<Suggestion>(Suggestion(query)));

    bookBloc.add(
      BookFetchEvent(
        SearchQueryModel(searchTerm: query, filters: filters),
      ),
    );

    return ResultsBuilder(
      query: query,
      filters: filters,
      bookBloc: bookBloc,
    );
  }
}
