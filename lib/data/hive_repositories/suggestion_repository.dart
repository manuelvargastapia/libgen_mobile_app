import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:libgen/data/hive_repositories/hive_repository.dart';
import 'package:libgen/domain/suggestion.dart';

class SuggestionRepository implements HiveRepository<Suggestion> {
  @override
  Box<Suggestion> box;

  static final SuggestionRepository _repository = SuggestionRepository._();

  SuggestionRepository._();

  factory SuggestionRepository(Box<Suggestion> box) {
    _repository.box = box;
    return _repository;
  }

  @override
  Future<Either<String, int>> add(Suggestion object) async {
    try {
      return right(await this.box.add(object));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, int>> clear() async {
    try {
      return right(await this.box.clear());
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, void>> delete(int index) async {
    try {
      return right(await this.box.deleteAt(index));
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Either<String, Suggestion> get(int index) {
    try {
      final Suggestion result = this.box.get(index);
      if (result == null) {
        throw Exception("Item not found");
      }
      return right(result);
    } catch (e) {
      return left(e.toString());
    }
  }
}
