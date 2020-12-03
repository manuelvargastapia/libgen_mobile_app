import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/data/book_repository.dart';
import 'package:libgen/data/download_repository.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

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
        listener: (context, downloadState) async {
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
          } else if (downloadState is FileNeedsToBeDownloadedFromBrowser) {
            final downloadFromBrowser = await showDialog<bool>(
              context: context,
              barrierDismissible: true,
              builder: (context) => AlertDialog(
                content: Text(
                  "The file is massive! Please, use the browser to download",
                ),
                actions: [
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  FlatButton(
                    child: Text('Open Browser'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
            );
            if (downloadFromBrowser) {
              launch(downloadState.url);
            }
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
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              icon: Icon(
                Icons.download_sharp,
                color: Theme.of(context).backgroundColor,
              ),
              onPressed: downloadState is DownloadStarting
                  ? null
                  : () {
                      context.bloc<DownloadBloc>().add(DownloadBookEvent(book));
                    },
              backgroundColor: downloadState is DownloadStarting
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).primaryColor,
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
