import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/blocs/book_bloc.dart';

import 'widgets/book_list/book_search_delegate.dart';

class SearchBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LibGen Mobile', style: TextStyle(fontSize: 48)),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Search by title, author or ISBN'),
                          Icon(Icons.search),
                        ],
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onTap: () {
                      showSearch(
                        context: context,
                        delegate: BookSearchDelegate(
                          bookBloc: BlocProvider.of<BookBloc>(context),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
