import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/book_bloc.dart';
import 'package:libgen/blocs/events/book_events.dart';
import 'package:libgen/blocs/events/hive_event.dart';
import 'package:libgen/blocs/hive_bloc.dart';
import 'package:libgen/blocs/states/hive_state.dart';
import 'package:libgen/domain/filters_fiction_model.dart';
import 'package:libgen/domain/search_query_model.dart';
import 'package:libgen/domain/suggestion.dart';
import 'package:libgen/screens/search_book/widgets/book_list/fiction_results_builder.dart';
import 'package:libgen/screens/search_book/widgets/book_list/show_fiction_filter_dialog.dart';
import 'package:libgen/screens/search_book/widgets/book_list/suggestions_builder.dart';
import 'package:libgen/generated/l10n.dart';

class FictionBookSearchDelegate extends SearchDelegate {
  FiltersFictionModel filters = FiltersFictionModel();

  BuildContext context;
  BookBloc bookBloc;
  HiveBloc<Suggestion> hiveBloc;

  FictionBookSearchDelegate({
    @required this.context,
    @required this.bookBloc,
    @required this.hiveBloc,
  }) : super(
          searchFieldLabel: S.of(context).searchBookDelegateSearchFieldLabel,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Theme.of(context).copyWith(
      primaryColor: isDarkMode ? Colors.transparent : Colors.white,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, size: 20),
        onPressed: () {
          query = '';
        },
      ),
      IconButton(
        icon: Icon(
          Icons.tune,
          color: Theme.of(context).buttonColor,
        ),
        onPressed: () async {
          filters = await showFictionFilterDialog(
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
    hiveBloc.add(CacheDataEvent<Suggestion>(Suggestion(query)));

    bookBloc.add(
      BookFetchFictionEvent(
        SearchQueryModel(searchTerm: query, filters: filters),
      ),
    );

    return FictionResultsBuilder(
      query: query,
      filters: filters,
      bookBloc: bookBloc,
    );
  }
}
