import 'package:libgen/global/theme/themes.dart';

class ThemeEvent {
  const ThemeEvent();
}

class ChangeTheme extends ThemeEvent {
  final AppTheme theme;
  const ChangeTheme(this.theme);
}
