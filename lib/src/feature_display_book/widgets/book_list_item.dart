import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_display_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_display_book/bloc/book_event.dart';
import 'package:libgen/src/feature_display_book/bloc/book_state.dart';
import 'package:libgen/src/feature_display_book/models/book_model.dart';

class BookListItem extends StatelessWidget {
  final BookModel book;

  const BookListItem(this.book);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(book.title),
      subtitle: Text('${book.author}, ${book.year}'),
      childrenPadding: const EdgeInsets.all(16),
      leading: BlocConsumer<BookBloc, BookState>(
        listener: (context, downloadState) {
          if (downloadState.md5 == book.md5) {
            if (downloadState is DownloadInProgress) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(downloadState.message)));
            } else if (downloadState is DownloadSuccessful) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(downloadState.message)));
            } else if (downloadState is BookErrorState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(downloadState.error)));
            }
          }
        },
        builder: (context, downloadState) {
          if (downloadState is DownloadSuccessful &&
              downloadState.md5 == book.md5) {
            context.bloc<BookBloc>().isDownloading = false;
            Scaffold.of(context).hideCurrentSnackBar();
          }
          return Container(
            margin: EdgeInsets.only(top: 8),
            child: DownloadIcon(
              downloadState: downloadState,
              md5: book.md5,
            ),
          );
        },
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
              )
      ],
    );
  }
}

class DownloadIcon extends StatelessWidget {
  final BookState downloadState;
  final String md5;

  DownloadIcon({@required this.downloadState, @required this.md5});

  @override
  Widget build(BuildContext context) {
    if (downloadState is DownloadInProgress && downloadState.md5 == md5) {
      return CircularProgressIndicator();
    }

    return IconButton(
      icon: Icon(Icons.download_rounded),
      onPressed: () {
        context.bloc<BookBloc>()
          ..isDownloading = true
          ..add(DownloadBookEvent(md5));
      },
    );
  }
}
