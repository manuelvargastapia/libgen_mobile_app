import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:libgen/blocs/states/theme_states.dart';
import 'package:libgen/global/theme/themes.dart';

class ThemeCubit extends Cubit<ThemeState> with HydratedMixin {
  ThemeCubit() : super(ThemeState(AppTheme.BlueLight)) {
    hydrate();
  }

  toggleTheme() => emit(
        ThemeState(
          state.appTheme == AppTheme.BlueLight
              ? AppTheme.BlueDark
              : AppTheme.BlueLight,
        ),
      );

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    return ThemeState(AppTheme.values[json['state'] as int]);
  }

  @override
  Map<String, int> toJson(ThemeState state) {
    return {'state': state.appTheme.index};
  }
}
