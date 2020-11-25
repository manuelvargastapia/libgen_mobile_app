import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:libgen/data/hive_repositories/hive_repository.dart';
import 'package:libgen/domain/suggestion.dart';

class SuggestionRepository implements HiveRepository<Suggestion> {
  static final SuggestionRepository _repository = SuggestionRepository._();

  SuggestionRepository._();

  factory SuggestionRepository() {
    return _repository;
  }

  @override
  Future<Either<String, int>> add(
      Box<Suggestion> box, Suggestion object) async {
    try {
      return right(await box.add(object));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> clear(
    Box<Suggestion> box,
  ) async {
    try {
      return right(await box.clear());
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> delete(Box<Suggestion> box, int index) async {
    try {
      return right(await box.deleteAt(index));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Either<String, Suggestion> get(Box<Suggestion> box, int index) {
    try {
      final Suggestion result = box.get(index);
      if (result == null) {
        throw Exception("Item not found");
      }
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }
}
