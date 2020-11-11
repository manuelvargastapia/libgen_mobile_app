import 'package:flutter/material.dart';

import 'book_search_delegate.dart';
import 'show_filter_dialog.dart';

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
