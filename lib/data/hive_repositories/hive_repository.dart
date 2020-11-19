import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

abstract class HiveRepository<T> {
  Box<T> box;
  Either<String, T> get(int index);
  Future<Either<String, int>> add(T object);
  Future<Either<String, void>> delete(int index);
  Future<Either<String, int>> clear();
}
