import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:libgen/global/environment/environment_config.dart';

final Uri _apiURL = Uri.parse(EnvironmentConfig.libgenApiURL);

class DownloadLinksRepository {
  static final DownloadLinksRepository _repository =
      DownloadLinksRepository._();

  DownloadLinksRepository._();

  factory DownloadLinksRepository() {
    return _repository;
  }

  http.Response _cachedResponse;
  String _cachedMd5;
  String _cachedDownloadPageURL;

  Future<dynamic> getDownloadLinks({String md5, String downloadPageURL}) async {
    try {
      if ((_cachedMd5 != null && _cachedMd5 == md5 ||
              _cachedDownloadPageURL != null &&
                  _cachedDownloadPageURL == downloadPageURL) &&
          _cachedResponse.statusCode == 200) {
        return _cachedResponse;
      }

      final response = await http.get(
        Uri(
          scheme: _apiURL.scheme,
          host: _apiURL.host,
          port: _apiURL.port,
          path: '/v2/download_links',
          queryParameters: downloadPageURL != null
              ? {
                  'downloadPageURL': downloadPageURL,
                }
              : {'md5': md5},
        ),
      );

      if (_cachedMd5 != md5) {
        _cachedMd5 = md5;
        _cachedResponse = response;
      }

      if (_cachedDownloadPageURL != downloadPageURL) {
        _cachedDownloadPageURL = downloadPageURL;
        _cachedResponse = response;
      }

      return response;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
