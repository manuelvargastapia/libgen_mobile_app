import 'package:flutter/material.dart';
import 'package:libgen/src/feature_display_book/models/book_model.dart';

class BookDetailsScreen extends StatelessWidget {
  final BookModel book;

  BookDetailsScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        actions: [],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Center(
          child: Text('Book Details'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.download_rounded,
          size: 38,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {},
        backgroundColor: Theme.of(context).textTheme.headline5.color,
      ),
    );
  }
}
