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
import 'package:libgen/global/widgets/custom_alert_dialog.dart';
import 'package:libgen/generated/l10n.dart';

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
                content: Text(
                  S.of(context).downloadButtonStartingDownloadMessage,
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
                duration: Duration(seconds: 8),
              ),
            );
          } else if (downloadState is DownloadError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  S.of(context).downloadButtonGenericErrorMessage,
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                ),
              ),
            );
          } else if (downloadState is DownloadPermissionsPermanentlyDenied) {
            showDialog(
              context: context,
              barrierDismissible: false,
              child: CustomAlertDialog(
                title: S.of(context).downloadButtonPermissionsDenied,
                textLeft: S.of(context).downloadButtonCancel,
                textRight: S.of(context).downloadButtonOpenSettings,
                callbacLeft: () {
                  Navigator.of(context).pop();
                },
                callbackRight: () {
                  openAppSettings();
                  Navigator.of(context).pop();
                },
                content: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    S.of(context).downloadButtonProvidePermissions,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            );
          } else if (downloadState is FileNeedsToBeDownloadedFromBrowser) {
            final dynamic downloadFromBrowser = await showDialog<bool>(
              context: context,
              barrierDismissible: true,
              builder: (context) => CustomAlertDialog(
                title: S.of(context).downloadButtonLargeFile,
                textLeft: S.of(context).downloadButtonCancel,
                textRight: S.of(context).downloadButtonOpenBrowser,
                callbacLeft: () {
                  Navigator.of(context).pop(false);
                },
                callbackRight: () {
                  Navigator.of(context).pop(true);
                },
                content: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    S.of(context).downloadButtonDownloadFromBrowser,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            );

            // It could be "null" because of "barrierDismissible: true".
            if (downloadFromBrowser == true) {
              launch(downloadState.url);
            }
          }
        },
        builder: (context, downloadState) {
          return Container(
            margin: const EdgeInsets.only(top: 8),
            child: FloatingActionButton.extended(
              elevation: 0,
              label: Text(
                book.fileExtension != null
                    ? book.fileExtension.toUpperCase()
                    : S.of(context).downloadButtonDefaultExtension,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.white),
              ),
              icon: Icon(Icons.download_sharp),
              onPressed: downloadState is DownloadStarting
                  ? null
                  : () {
                      context.bloc<DownloadBloc>().add(DownloadBookEvent(book));
                    },
              backgroundColor: downloadState is DownloadStarting
                  ? Theme.of(context).disabledColor
                  : Theme.of(context).accentColor,
            ),
          );
        },
      ),
    );
  }
}
