import 'package:flutter/foundation.dart';
import 'package:libgen/src/feature_show_book_details/models/details_model.dart';

abstract class DetailsState {
  const DetailsState();
}

class DetailsInitialState extends DetailsState {
  const DetailsInitialState();
}

class DetailsLoadingState extends DetailsState {
  final String message;

  const DetailsLoadingState({@required this.message});
}

class DetailsSuccessState extends DetailsState {
  final DetailsModel bookDetails;

  const DetailsSuccessState({@required this.bookDetails});
}

class DetailsErrorState extends DetailsState {
  final String error;

  const DetailsErrorState({@required this.error});
}
