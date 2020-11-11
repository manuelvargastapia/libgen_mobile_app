import 'package:flutter/material.dart';
import 'package:libgen/src/feature_display_book/widgets/book_list/results_builder.dart';

class BookSearchDelegate extends SearchDelegate {
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

    return ResultsBuilder(
      query: query,
      searchIn: searchIn,
      sortBy: sortBy,
    );
  }
}
