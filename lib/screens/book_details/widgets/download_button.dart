import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/blocs/events/download_event.dart';
import 'package:libgen/data/book_repository.dart';
import 'package:libgen/data/download_repository.dart';
import 'package:libgen/domain/book_sci_tech_model.dart';
import 'package:libgen/domain/download_link_model.dart';
import 'package:libgen/domain/i_book_model.dart';
import 'package:libgen/screens/book_details/widgets/download_button/floating_action_button_downloads.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:libgen/blocs/download_bloc.dart';
import 'package:libgen/blocs/states/download_state.dart';
import 'package:libgen/global/widgets/custom_alert_dialog.dart';
import 'package:libgen/generated/l10n.dart';

class DownloadButton extends StatelessWidget {
  final BookModel book;
  final Widget label;
  final List<DownloadLinkModel> links;
  final bool isLoading;
  final bool hasError;

  DownloadButton({
    @required this.label,
    this.book,
    this.links,
    this.isLoading = false,
    this.hasError = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DownloadBloc(
        bookRepository: BookRepository(),
        downloadRepository: DownloadRepository(),
      ),
      child: BlocConsumer<DownloadBloc, DownloadState>(
        listener: _downloadBlocListener,
        builder: (context, state) {
          Widget icon = Icon(Icons.download_sharp, size: 24);
          Color mainButtonBackgroundColor = Theme.of(context).buttonColor;

          if (isLoading) {
            icon = SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).disabledColor,
                ),
              ),
            );
            mainButtonBackgroundColor = Theme.of(context).disabledColor;
          }

          if (hasError) {
            icon = Icon(Icons.error_outline, size: 24);
            mainButtonBackgroundColor = Theme.of(context).disabledColor;
          }

          return Container(
            margin: const EdgeInsets.only(top: 8),
            child: FloatingActionButtonDownloads(
              items: isLoading || hasError ? [] : links,
              label: label,
              icon: icon,
              onSelected: isLoading
                  ? null
                  : (DownloadLinkModel link) {
                      if (state is! DownloadStarting) {
                        context.bloc<DownloadBloc>().add(
                              book is BookSciTechModel
                                  ? SciTechDownloadBookEvent(book, link.url)
                                  : FictionDownloadBookEvent(book, link.url),
                            );
                      }
                    },
              optionButtonsBackgroundColor: Theme.of(context).primaryColor,
              mainButtonBackgroundColor: mainButtonBackgroundColor,
            ),
          );
        },
      ),
    );
  }
}

void _downloadBlocListener(context, state) async {
  if (state is DownloadStarting) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          S.of(context).downloadButtonStartingDownloadMessage,
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
        duration: Duration(seconds: 8),
      ),
    );
  } else if (state is DownloadError) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          S.of(context).downloadButtonGenericErrorMessage,
          style: Theme.of(context).primaryTextTheme.bodyText1,
        ),
      ),
    );
  } else if (state is DownloadPermissionsPermanentlyDenied) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CustomAlertDialog(
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
        );
      },
    );
  } else if (state is FileNeedsToBeDownloadedFromBrowser) {
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
      launch(state.url);
    }
  }
}
