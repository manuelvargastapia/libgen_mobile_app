import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:libgen/global/environment/environment_config.dart';

const String _apiURL = EnvironmentConfig.libgenApiURL;

class FictionLanguagesRepository {
  static final FictionLanguagesRepository _fictionLanguagesRepository =
      FictionLanguagesRepository._();

  FictionLanguagesRepository._();

  factory FictionLanguagesRepository() {
    return _fictionLanguagesRepository;
  }

  Future<dynamic> getFictionLanguagesList() async {
    try {
      return await http.get(
        Uri.parse('$_apiURL/fiction/languages'),
      );
    } catch (e) {
      return e;
    }
  }
}
