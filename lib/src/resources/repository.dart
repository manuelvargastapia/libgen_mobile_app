import 'dart:async';

import '../models/result.dart';
import 'book_api_provider.dart';

class Repository {
  final BookApiProvider provider = BookApiProvider();

  Future<Result> searchBooks(query) => provider.fetchBookList(query);
}
