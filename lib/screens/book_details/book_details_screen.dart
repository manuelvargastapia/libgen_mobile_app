import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/book_bloc.dart';
import 'package:libgen/blocs/events/book_events.dart';
import 'package:libgen/blocs/states/book_states.dart';
import 'package:libgen/domain/book_model.dart';
import 'package:libgen/screens/book_details/widgets/book_details_consumer.dart';

class BookDetailsScreen extends StatelessWidget {
  final BookModel book;

  BookDetailsScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    final BookBloc _bookBloc = BlocProvider.of<BookBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title ?? "(no title)"),
        actions: [],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BookDetailsConsumer(bookId: book.id),
      floatingActionButton: BlocConsumer<BookBloc, BookState>(
        listener: (context, downloadState) {
          if (downloadState is DownloadInProgress) {
            _bookBloc.isDownloading = false;
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
          return Container(
            margin: EdgeInsets.only(top: 8),
            child: downloadState is DownloadStarting
                ? CircularProgressIndicator()
                : FloatingActionButton(
                    child: Icon(
                      Icons.download_rounded,
                      size: 38,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      _bookBloc
                        ..isDownloading = true
                        ..add(DownloadBookEvent(book.md5));
                    },
                    backgroundColor:
                        Theme.of(context).textTheme.headline5.color,
                  ),
          );
        },
      ),
    );
  }
}
