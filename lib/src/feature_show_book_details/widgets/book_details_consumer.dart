import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_show_book_details/bloc/details_bloc.dart';
import 'package:libgen/src/feature_show_book_details/bloc/details_event.dart';
import 'package:libgen/src/feature_show_book_details/bloc/details_state.dart';
import 'package:libgen/src/feature_show_book_details/repository/details_repository.dart';
import 'package:libgen/src/feature_show_book_details/widgets/book_details_presenter.dart';

class BookDetailsConsumer extends StatelessWidget {
  final int bookId;

  BookDetailsConsumer({@required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
        create: (BuildContext context) =>
            DetailsBloc(repository: BookDetailsRepository())
              ..add(DetailsFetchEvent(bookId)),
        child: BlocConsumer<DetailsBloc, DetailsState>(
            listener: (context, detailsState) {
          if (detailsState is DetailsLoadingState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(detailsState.message)),
            );
          } else if (detailsState is DetailsErrorState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(detailsState.error)),
            );
            Navigator.pop(context);
            BlocProvider.of<DetailsBloc>(context).isFetching = false;
          }
        }, builder: (context, detailsState) {
          if (detailsState is DetailsInitialState ||
              detailsState is DetailsLoadingState) {
            return CircularProgressIndicator();
          } else if (detailsState is DetailsSuccessState) {
            BlocProvider.of<DetailsBloc>(context).isFetching = false;
            Scaffold.of(context).hideCurrentSnackBar();
            return BookDetailsPresenter(bookDetails: detailsState.bookDetails);
          }
        }),
      ),
    );
  }
}
