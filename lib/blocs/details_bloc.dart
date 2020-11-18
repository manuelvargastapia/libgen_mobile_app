import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:libgen/blocs/events/details_event.dart';
import 'package:libgen/blocs/states/details_state.dart';
import 'package:libgen/domain/details_model.dart';
import 'package:libgen/data/details_repository.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final BookDetailsRepository repository;
  bool isFetching = false;

  DetailsBloc({@required this.repository}) : super(DetailsInitialState());

  @override
  Stream<DetailsState> mapEventToState(DetailsEvent event) async* {
    if (event is DetailsFetchEvent) {
      yield DetailsLoadingState();
      final response = await repository.getBookDetails(event.bookId);
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final jsonDetails = jsonDecode(response.body)['data'][0];
          final DetailsModel bookDetails = DetailsModel.fromJson(jsonDetails);
          yield DetailsSuccessState(bookDetails: bookDetails);
        } else {
          yield DetailsErrorState(
            error: "Ups! We messed up. Try again later, please",
          );
        }
      } else if (response is String) {
        yield DetailsErrorState(
          error: "Ups! We messed up. Try again later, please",
        );
      }
    }
  }
}
