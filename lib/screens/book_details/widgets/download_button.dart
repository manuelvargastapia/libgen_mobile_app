import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/data/book_repository.dart';
import 'package:libgen/data/download_repository.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:libgen/blocs/download_bloc.dart';
import 'package:libgen/blocs/events/download_event.dart';
import 'package:libgen/blocs/states/download_state.dart';
import 'package:libgen/domain/book_model.dart';

class DownloadButton extends StatelessWidget {
  final BookModel book;

  DownloadButton(this.book);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DownloadBloc(
        bookRepository: BookRepository(),
        downloadRepository: DownloadRepository(),
      ),
      child: BlocConsumer<DownloadBloc, DownloadState>(
        listener: (context, downloadState) {
          if (downloadState is DownloadStarting) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(downloadState.message),
                duration: Duration(seconds: 8),
              ),
            );
          } else if (downloadState is DownloadError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(downloadState.error)),
            );
          } else if (downloadState is DownloadPermissionsPermanentlyDenied) {
            showDialog(
              context: context,
              barrierDismissible: false,
              child: AlertDialog(
                actions: _buildAlertDialogActions(context),
                content: Text(
                  "Please, provide permissions app from app settings",
                ),
              ),
            );
          }
        },
        builder: (context, downloadState) {
          return Container(
            margin: const EdgeInsets.only(top: 8),
            child: FloatingActionButton.extended(
              label: Text(
                book.fileExtension != null
                    ? book.fileExtension.toUpperCase()
                    : "TXT",
              ),
              icon: Icon(
                Icons.download_sharp,
                size: 38,
              ),
              onPressed: downloadState is DownloadStarting
                  ? null
                  : () {
                      context.bloc<DownloadBloc>().add(DownloadBookEvent(book));
                    },
              backgroundColor: downloadState is DownloadStarting
                  ? Colors.grey
                  : Theme.of(context).accentColor,
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildAlertDialogActions(BuildContext context) {
    return [
      FlatButton(
        child: Text('Cancel'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      FlatButton(
        child: Text('Open Settings'),
        onPressed: () {
          openAppSettings();
          Navigator.of(context).pop();
        },
      ),
    ];
  }
}
