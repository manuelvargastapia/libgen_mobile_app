import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:libgen/blocs/events/theme_events.dart';
import 'package:libgen/blocs/states/theme_states.dart';
import 'package:libgen/global/theme/themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeState(AppTheme.BlueLight)) {
    hydrate();
  }

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ChangeTheme) {
      yield ThemeState(event.theme);
    }
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    return ThemeState(AppTheme.values[json['state'] as int]);
  }

  @override
  Map<String, int> toJson(ThemeState state) {
    return {'state': state.appTheme.index};
  }
}
