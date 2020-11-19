import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/download_bloc.dart';
import 'package:libgen/blocs/events/download_event.dart';
import 'package:libgen/blocs/states/download_state.dart';

class DownloadButton extends StatelessWidget {
  final String md5;

  DownloadButton(this.md5);

  @override
  Widget build(BuildContext context) {
    final DownloadBloc _bloc = BlocProvider.of<DownloadBloc>(context);

    return BlocConsumer<DownloadBloc, DownloadState>(
      listener: (context, downloadState) {
        if (downloadState is DownloadInProgress) {
          _bloc.isDownloading = false;
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(downloadState.message)),
          );
        } else if (downloadState is DownloadError) {
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
                    _bloc
                      ..isDownloading = true
                      ..add(DownloadBookEvent(md5));
                  },
                  backgroundColor: Theme.of(context).textTheme.headline5.color,
                ),
        );
      },
    );
  }
}
