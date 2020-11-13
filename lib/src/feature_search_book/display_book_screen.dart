import 'package:flutter/material.dart';
import 'package:libgen/src/feature_search_book/widgets/book_list/book_list.dart';

class DisplayBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookList(),
    );
  }
}
