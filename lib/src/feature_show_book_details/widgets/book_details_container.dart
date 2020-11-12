import 'package:flutter/material.dart';

class BookDetailsContainer extends StatelessWidget {
  final int bookId;

  BookDetailsContainer({@required this.bookId});

  @override
  Widget build(BuildContext context) {
    print("Book ID: $bookId");
    return Container();
  }
}
