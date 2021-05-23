import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:libgen/global/environment/environment_config.dart';

final Uri _apiURL = Uri.parse(EnvironmentConfig.libgenApiURL);

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
        Uri(
          scheme: _apiURL.scheme,
          host: _apiURL.host,
          port: _apiURL.port,
          path: '/fiction/languages',
        ),
      );
    } catch (e) {
      return e;
    }
  }
}
