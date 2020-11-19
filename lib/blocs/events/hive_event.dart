abstract class HiveEvent<T> {
  const HiveEvent();
}

class CacheDataEvent<T> extends HiveEvent<T> {
  final T data;
  const CacheDataEvent(this.data);
}

class LoadItemEvent<T> extends HiveEvent<T> {
  final int index;
  const LoadItemEvent(this.index);
}

class LoadAllEvent<T> extends HiveEvent<T> {
  const LoadAllEvent();
}

class DeleteItemEvent<T> extends HiveEvent<T> {
  final int index;
  const DeleteItemEvent(this.index);
}

class ClearCacheEvent<T> extends HiveEvent<T> {
  const ClearCacheEvent();
}
