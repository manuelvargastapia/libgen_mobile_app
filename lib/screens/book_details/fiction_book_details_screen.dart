import 'package:flutter/material.dart';
import 'package:libgen/domain/book_fiction_model.dart';

import 'package:libgen/screens/book_details/widgets/book_details_presenter.dart';
import 'package:libgen/screens/book_details/widgets/download_button.dart';

class FictionBookDetailsScreen extends StatelessWidget {
  final BookFictionModel book;

  FictionBookDetailsScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Material(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
            ),
            color: Theme.of(context).accentIconTheme.color,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: BookDetailsPresenter(book: book),
        floatingActionButton: DownloadButton(book),
      ),
    );
  }
}
