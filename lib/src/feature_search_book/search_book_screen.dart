import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_search_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_search_book/widgets/book_list/book_search_delegate.dart';

class SearchBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: () {
          showSearch(
            context: context,
            delegate: BookSearchDelegate(
              bookBloc: BlocProvider.of<BookBloc>(context),
            ),
          );
        }),
      ),
    );
  }
}
