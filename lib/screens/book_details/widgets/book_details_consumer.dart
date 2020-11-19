import 'package:flutter/material.dart';
import 'package:libgen/domain/book_model.dart';
import 'package:libgen/screens/book_details/widgets/book_details_presenter.dart';

class BookDetailsConsumer extends StatelessWidget {
  final BookModel book;

  BookDetailsConsumer({@required this.book});

  @override
  Widget build(BuildContext context) {
    return BookDetailsPresenter(book: book);
  }
}
