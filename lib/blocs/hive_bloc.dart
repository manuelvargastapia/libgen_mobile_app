import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:libgen/blocs/states/hive_state.dart';
import 'package:libgen/data/hive_repositories/hive_repository.dart';

import 'events/hive_event.dart';

class HiveBloc<T> extends Bloc<HiveEvent<T>, HiveState> {
  final Box<T> box;
  final HiveRepository<T> repository;

  HiveBloc({@required this.repository, @required this.box})
      : super(HiveInitialState());

  @override
  Stream<HiveState> mapEventToState(HiveEvent<T> event) async* {
    if (event is CacheDataEvent<T>) {
      if (!box.values.contains(event.data)) {
        final Either<String, int> result =
            await repository.add(box, event.data);
        yield result.fold<HiveState>(
          (l) => HiveErrorState(l),
          (r) => HiveSuccessState(),
        );
      }
    } else if (event is LoadAllEvent<T>) {
      if (box.isNotEmpty) {
        yield HiveSuccessState(data: box.values.toList());
      } else {
        yield HiveErrorState();
      }
    } else if (event is DeleteItemEvent<T>) {
      if (box.isNotEmpty) {
        final Either<String, void> result =
            await repository.delete(box, event.index);
        yield result.fold<HiveState>(
          (l) => HiveErrorState(l),
          (r) => HiveSuccessState(data: box.values.toList()),
        );
      } else {
        yield HiveErrorState();
      }
    }
  }
}
