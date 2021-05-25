import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/blocs/download_links_bloc.dart';
import 'package:libgen/blocs/events/download_links_events.dart';
import 'package:libgen/blocs/states/download_links_states.dart';
import 'package:libgen/data/download_links_repository.dart';
import 'package:libgen/domain/book_fiction_model.dart';
import 'package:libgen/generated/l10n.dart';

import 'package:libgen/screens/book_details/widgets/book_details_presenter.dart';
import 'package:libgen/screens/book_details/widgets/download_button.dart';

class FictionBookDetailsScreen extends StatelessWidget {
  final BookFictionModel book;

  FictionBookDetailsScreen({@required this.book});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Material(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
            ),
            color: Theme.of(context).accentIconTheme.color,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: BookDetailsPresenter(book: book),
        floatingActionButton: BlocProvider(
          create: (context) => DownloadLinksBloc(
            downloadLinksRepository: DownloadLinksRepository(),
          )..add(
              DownloadLinksFetchEvent(
                downloadPageURL: book.downloadPageURL,
              ),
            ),
          child: BlocConsumer<DownloadLinksBloc, DownloadLinksState>(
            listener: (context, state) {
              if (state is DownloadLinksErrorState) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      S.of(context).downloadButtonGenericErrorMessage,
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                );
              }

              if (state is DownloadLinksConnectionFailed) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      S.of(context).downloadButtonConnectionFailedErrorMessage,
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
                  ),
                );
              }
            },
            builder: (context, state) {
              final label = Text(
                book.fileExtension != null
                    ? book.fileExtension.toUpperCase()
                    : S.of(context).downloadButtonDefaultExtension,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white),
              );

              Widget button = Container();

              if (state is DownloadLinksLoadingState) {
                button = DownloadButton(label: label, isLoading: true);
              }

              if (state is DownloadLinksSuccessState) {
                button = DownloadButton(
                  label: label,
                  book: book,
                  links: state.links,
                );
              }

              if (state is DownloadLinksErrorState ||
                  state is DownloadLinksConnectionFailed) {
                button = DownloadButton(label: label, hasError: true);
              }

              return button;
            },
          ),
        ),
      ),
    );
  }
}
