import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/states/hive_state.dart';
import 'package:libgen/data/hive_repositories/hive_repository.dart';

import 'events/hive_event.dart';

class HiveBloc<T> extends Bloc<HiveEvent<T>, HiveState> {
  final HiveRepository<T> repository;

  HiveBloc({@required this.repository}) : super(HiveInitialState());

  @override
  Stream<HiveState> mapEventToState(HiveEvent<T> event) async* {
    if (event is CacheDataEvent<T>) {
      if (!repository.box.values.contains(event.data)) {
        final Either<String, int> result = await repository.add(event.data);
        yield result.fold<HiveState>(
          (l) => HiveErrorState(l),
          (r) => HiveSuccessState(),
        );
      }
    }
    if (event is LoadAllEvent<T>) {
      if (repository.box.isNotEmpty) {
        yield HiveSuccessState(data: repository.box.values);
      }
    }
    if (event is LoadItemEvent<T>) {
      if (repository.box.isNotEmpty) {
        final Either<String, T> result = repository.get(event.index);
        yield result.fold<HiveState>(
          (l) => HiveErrorState(l),
          (r) => HiveSuccessState(data: r),
        );
      } else {
        yield HiveErrorState("Box is empty");
      }
    }
    if (event is DeleteItemEvent<T>) {
      if (repository.box.isNotEmpty) {
        final Either<String, void> result =
            await repository.delete(event.index);
        yield result.fold<HiveState>(
          (l) => HiveErrorState(l),
          (r) => HiveSuccessState(data: repository.box.values),
        );
      } else {
        yield HiveErrorState("Box is empty");
      }
    }
    if (event is ClearCacheEvent<T>) {
      final Either<String, int> result = await repository.clear();
      yield result.fold<HiveState>(
        (l) => HiveErrorState(l),
        (r) => HiveSuccessState(),
      );
    }
  }
}
