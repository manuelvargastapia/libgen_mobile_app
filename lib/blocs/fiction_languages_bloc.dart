import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/events/fiction_languages_events.dart';
import 'package:libgen/blocs/states/fiction_languages_states.dart';
import 'package:libgen/data/fiction_languages_repository.dart';

class FictionLanguagesBloc
    extends Bloc<FictionLanguagesEvent, FictionLanguagesState> {
  final FictionLanguagesRepository fictionLanguagesRepository;

  FictionLanguagesBloc({@required this.fictionLanguagesRepository})
      : super(FictionLanguagesInitialState());

  @override
  Stream<FictionLanguagesState> mapEventToState(
      FictionLanguagesEvent event) async* {
    if (event is LanguagesFetchEvent) {
      yield FictionLanguagesLoadingState();
      final response =
          await fictionLanguagesRepository.getFictionLanguagesList();
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final rawResponse = jsonDecode(response.body);
          final rawLanguages = rawResponse['data'] as List;
          final languages =
              rawLanguages.map((language) => language.toString()).toList();
          yield FictionLanguagesSuccessState(languages);
        } else {
          yield FictionLanguagesErrorState();
        }
      } else if (response is SocketException) {
        yield FictionLanguagesConnectionFailedState();
      } else {
        yield FictionLanguagesErrorState();
      }
    }
  }
}
