import 'package:flutter/material.dart';

import 'package:libgen/domain/book_model.dart';
import 'package:libgen/screens/book_details/widgets/book_details_presenter.dart';
import 'package:libgen/screens/book_details/widgets/download_button.dart';

class BookDetailsScreen extends StatelessWidget {
  final BookModel book;

  BookDetailsScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        extendBodyBehindAppBar: true,
        body: BookDetailsPresenter(book: book),
        floatingActionButton: DownloadButton(book),
      ),
    );
  }
}
