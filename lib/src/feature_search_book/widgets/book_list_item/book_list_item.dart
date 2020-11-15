import 'package:flutter/material.dart';
import 'package:libgen/src/feature_search_book/models/book_model.dart';
import 'package:libgen/src/feature_show_book_details/book_details_screen.dart';

class BookListItem extends StatelessWidget {
  final BookModel book;

  const BookListItem(this.book);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        book.title,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text('by ${book.author}'),
      trailing: Text(book.fileExtension.toUpperCase()),
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsScreen(book: book),
          ),
        );
      },
    );
  }
}
