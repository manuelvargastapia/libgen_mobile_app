import 'package:rxdart/rxdart.dart';

import '../models/result.dart';
import '../resources/repository.dart';

class BookBloc {
  final Repository _repository = Repository();
  final PublishSubject _booksFetcher = PublishSubject<Result>();

  Stream<Result> get books => _booksFetcher.stream;

  fetchBooks(String query) async {
    Result result = await _repository.searchBooks(query);
    _booksFetcher.sink.add(result);
  }

  dispose() {
    _booksFetcher.close();
  }
}

final bookBloc = BookBloc();
