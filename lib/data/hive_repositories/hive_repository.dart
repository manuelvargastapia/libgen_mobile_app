import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

abstract class HiveRepository<T> {
  Either<String, T> get(Box<T> box, int index);
  Future<Either<String, void>> add(Box<T> box, T object);
  Future<Either<String, void>> delete(Box<T> box, int index);
  Future<Either<String, int>> clear(Box<T> box);
}
