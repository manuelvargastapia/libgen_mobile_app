import 'package:hive/hive.dart';

class HiveRepository<T> {
  final Box _box;

  HiveRepository(this._box);

  Future<T> getByKey(dynamic key) async {
    return this._box.get(key);
  }

  Future<T> getByIndex(int index) async {
    return this._box.getAt(index);
  }

  Future<void> add(T object) async {
    await this._box.add(object);
  }

  Future<void> deleteByKey(dynamic key) async {
    await this._box.delete(key);
  }

  Future<void> deleteByIndex(int index) async {
    await this._box.deleteAt(index);
  }

  Future<int> clear() async {
    return await this._box.clear();
  }
}
