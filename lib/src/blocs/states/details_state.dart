import 'package:flutter/foundation.dart';
import 'package:libgen/src/domain/details_model.dart';

abstract class DetailsState {
  const DetailsState();
}

class DetailsInitialState extends DetailsState {
  const DetailsInitialState();
}

class DetailsLoadingState extends DetailsState {
  const DetailsLoadingState();
}

class DetailsSuccessState extends DetailsState {
  final DetailsModel bookDetails;

  const DetailsSuccessState({@required this.bookDetails});
}

class DetailsErrorState extends DetailsState {
  final String error;

  const DetailsErrorState({@required this.error});
}
