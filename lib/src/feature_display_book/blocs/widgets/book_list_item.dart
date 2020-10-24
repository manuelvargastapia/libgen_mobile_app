import 'package:flutter/material.dart';
import 'package:libgen/src/feature_display_book/blocs/models/book_model.dart';

class BookListItem extends StatelessWidget {
  final BookModel book;

  const BookListItem(this.book);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(book.title),
      subtitle: Text('${book.author}, ${book.year}'),
      childrenPadding: const EdgeInsets.all(16),
      leading: Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(book.id.toString()),
      ),
      children: [
        Container()
        // book?.coverUrl == null
        //     ? Container()
        //     : Image.network(
        //         book.coverUrl,
        //         loadingBuilder: (context, widget, imageChunkEvent) {
        //           return imageChunkEvent == null
        //               ? widget
        //               : CircularProgressIndicator();
        //         },
        //         height: 300,
        //       )
      ],
    );
  }
}
