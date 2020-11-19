abstract class HiveState {
  const HiveState();
}

class HiveInitialState extends HiveState {
  const HiveInitialState();
}

class HiveSuccessState extends HiveState {
  final dynamic data;
  const HiveSuccessState({this.data});
}

class HiveErrorState extends HiveState {
  final String error;
  const HiveErrorState(this.error);
}
