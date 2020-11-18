import 'package:hive/hive.dart';
import 'package:equatable/equatable.dart';

part 'suggestion.g.dart';

@HiveType(typeId: 0)
class Suggestion extends Equatable {
  @HiveField(0)
  final String query;

  Suggestion(this.query);

  @override
  List<Object> get props => [query];
}
