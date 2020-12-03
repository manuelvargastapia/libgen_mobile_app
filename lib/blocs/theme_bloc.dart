import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/events/theme_events.dart';
import 'package:libgen/blocs/states/theme_states.dart';
import 'package:libgen/global/theme/themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeInitialState(appThemeData[AppTheme.BlueLight]));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ChangeTheme) {
      yield ThemeState(appThemeData[event.theme]);
    }
  }
}
