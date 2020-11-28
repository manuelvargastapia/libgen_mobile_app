import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/download_bloc.dart';
import 'package:libgen/blocs/events/download_event.dart';
import 'package:libgen/blocs/states/download_state.dart';
import 'package:libgen/domain/book_model.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadButton extends StatelessWidget {
  final BookModel book;

  DownloadButton(this.book);

  @override
  Widget build(BuildContext context) {
    final DownloadBloc _bloc = BlocProvider.of<DownloadBloc>(context);

    return BlocConsumer<DownloadBloc, DownloadState>(
      listener: (context, downloadState) {
        if (downloadState is DownloadInProgress) {
          _bloc.isDownloading = false;
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
          child: downloadState is DownloadStarting
              ? CircularProgressIndicator()
              : FloatingActionButton(
                  child: Icon(
                    Icons.download_rounded,
                    size: 38,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    _bloc
                      ..isDownloading = true
                      ..add(DownloadBookEvent(book));
                  },
                  backgroundColor: Theme.of(context).textTheme.headline5.color,
                ),
        );
      },
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
