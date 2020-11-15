import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_show_book_details/bloc/details_event.dart';
import 'package:libgen/src/feature_show_book_details/bloc/details_state.dart';
import 'package:libgen/src/feature_show_book_details/models/details_model.dart';
import 'package:libgen/src/feature_show_book_details/repository/details_repository.dart';

import 'package:http/http.dart' as http;

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
          yield DetailsErrorState(error: response.body);
        }
      } else if (response is String) {
        yield DetailsErrorState(error: response);
      }
    }
  }
}
