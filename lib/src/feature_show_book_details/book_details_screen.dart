import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_display_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_display_book/bloc/book_event.dart';
import 'package:libgen/src/feature_display_book/bloc/book_state.dart';
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
      floatingActionButton: BlocConsumer<BookBloc, BookState>(
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
          if (downloadState is DownloadSuccessful) {
            context.bloc<BookBloc>().isDownloading = false;
            Scaffold.of(context).hideCurrentSnackBar();
          }
          return Container(
              margin: EdgeInsets.only(top: 8),
              child: downloadState is DownloadInProgress
                  ? CircularProgressIndicator()
                  : FloatingActionButton(
                      child: Icon(
                        Icons.download_rounded,
                        size: 38,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        BlocProvider.of<BookBloc>(context)
                          ..isDownloading = true
                          ..add(DownloadBookEvent(book.md5));
                      },
                      backgroundColor:
                          Theme.of(context).textTheme.headline5.color,
                    ));
        },
      ),
    );
  }
}
