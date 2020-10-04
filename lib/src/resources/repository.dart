import 'dart:async';

import 'package:libgen/src/models/downloadLink.dart';

import '../models/result.dart';
import 'book_api_provider.dart';

class Repository {
  final BookApiProvider provider = BookApiProvider();

  Future<Result> searchBooks(String query) => provider.fetchBookList(query);

  Future<DownloadLink> getDownloadLink(String md5) =>
      provider.fetchDownloadLink(md5);
}
