import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_search_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_search_book/bloc/book_event.dart';
import 'package:libgen/src/feature_search_book/bloc/book_state.dart';
import 'package:libgen/src/feature_search_book/models/book_model.dart';
import 'package:libgen/src/feature_search_book/repository/book_repository.dart';
import 'package:libgen/src/feature_show_book_details/book_details_screen.dart';

class BookListItem extends StatelessWidget {
  final BookModel book;

  const BookListItem(this.book);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(book.title),
      subtitle: Text('${book.author}, ${book.fileExtension}'),
      childrenPadding: EdgeInsets.all(16),
      leading: BlocProvider(
        create: (context) => BookBloc(bookRepository: BookRepository()),
        child: BlocConsumer<BookBloc, BookState>(
          listener: (context, downloadState) {
            if (downloadState is DownloadInProgress) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(downloadState.message)),
              );
            } else if (downloadState is DownloadSuccessful) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(downloadState.message)),
              );
            } else if (downloadState is BookErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text(downloadState.error)),
              );
            }
          },
          builder: (context, downloadState) {
            final BookBloc _bookBloc = BlocProvider.of<BookBloc>(context);
            if (downloadState is DownloadSuccessful) {
              _bookBloc.isDownloading = false;
              Scaffold.of(context).hideCurrentSnackBar();
            }
            return Container(
                margin: EdgeInsets.only(top: 8),
                child: downloadState is DownloadInProgress
                    ? CircularProgressIndicator()
                    : IconButton(
                        icon: Icon(Icons.download_rounded),
                        onPressed: () {
                          _bookBloc
                            ..isDownloading = true
                            ..add(DownloadBookEvent(book.md5));
                        },
                      ));
          },
        ),
      ),
      children: [
        book?.coverUrl == null
            ? Container()
            : Image.network(
                book.coverUrl,
                loadingBuilder: (context, widget, imageChunkEvent) {
                  return imageChunkEvent == null
                      ? widget
                      : CircularProgressIndicator();
                },
                height: 300,
              ),
        RaisedButton(
            child: Text('Details'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(book: book),
                ),
              );
            })
      ],
    );
  }
}
