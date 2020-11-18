import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/blocs/details_bloc.dart';
import 'package:libgen/src/blocs/events/details_event.dart';
import 'package:libgen/src/blocs/states/details_state.dart';
import 'package:libgen/src/data/details_repository.dart';
import 'package:libgen/src/screens/book_details/widgets/book_details_presenter.dart';

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
            if (detailsState is DetailsErrorState) {
              BlocProvider.of<DetailsBloc>(context).isFetching = false;
            }
          },
          builder: (context, detailsState) {
            final DetailsBloc _bloc = BlocProvider.of<DetailsBloc>(context);
            if (detailsState is DetailsInitialState ||
                detailsState is DetailsLoadingState) {
              return CircularProgressIndicator();
            } else if (detailsState is DetailsErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      _bloc
                        ..isFetching = true
                        ..add(
                          DetailsFetchEvent(bookId),
                        );
                    },
                    icon: Icon(Icons.refresh),
                  ),
                  SizedBox(height: 15),
                  Text(detailsState.error, textAlign: TextAlign.center),
                ],
              );
            }
            BlocProvider.of<DetailsBloc>(context).isFetching = false;
            Scaffold.of(context).hideCurrentSnackBar();
            return BookDetailsPresenter(
              bookDetails: (detailsState as DetailsSuccessState).bookDetails,
            );
          },
        ),
      ),
    );
  }
}
