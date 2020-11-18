import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:libgen/blocs/book_bloc.dart';
import 'package:libgen/domain/filters_model.dart';
import 'package:libgen/domain/suggestion.dart';
import 'results_builder.dart';
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
    final suggestionsBox = Hive.box('suggestions');
    return ValueListenableBuilder(
        valueListenable: suggestionsBox.listenable(),
        builder: (context, suggestionsBox, child) {
          return ListView.builder(
            itemCount: suggestionsBox.length,
            itemBuilder: (context, index) {
              final suggestion = suggestionsBox.getAt(index) as Suggestion;
              return ListTile(
                leading: Icon(Icons.history_edu_rounded),
                title: Text(suggestion.query),
                onTap: () {
                  query = suggestion.query;
                  showResults(context);
                },
                trailing: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 18,
                  ),
                  onPressed: () {
                    suggestionsBox.deleteAt(index);
                  },
                ),
              );
            },
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().length < 4) {
      return Container();
    }

    final suggestionsBox = Hive.box('suggestions');
    final suggestion = Suggestion(query.trim());

    if (!suggestionsBox.values.contains(suggestion)) {
      suggestionsBox.add(Suggestion(query.trim()));
    }

    return ResultsBuilder(
      query: query,
      filters: filters,
      bookBloc: bookBloc,
    );
  }
}
