import 'package:flutter/material.dart';
import 'package:libgen/domain/book_fiction_model.dart';
import 'package:libgen/screens/book_details/fiction_book_details_screen.dart';

import 'package:libgen/generated/l10n.dart';

class FictionBookListItem extends StatelessWidget {
  final BookFictionModel book;

  FictionBookListItem(this.book);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        book.title ?? S.of(context).bookListItemNoTitle,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: book.author != null
          ? Text(
              S.of(context).bookListItemByAuthor(book.author),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption.copyWith(fontSize: 16),
            )
          : null,
      trailing: book.fileExtension != null
          ? Text(
              book.fileExtension.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText2,
            )
          : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FictionBookDetailsScreen(book: book),
          ),
        );
      },
    );
  }
}
