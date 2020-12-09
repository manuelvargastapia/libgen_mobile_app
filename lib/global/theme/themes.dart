import 'package:flutter/material.dart';

import 'package:libgen/global/navigation/fade_transition_builder.dart';

enum AppTheme { BlueLight, BlueDark }

MaterialColor _createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

final _primarySwatchLight = _createMaterialColor(Color(0xFF548cd4));
final _primarySwatchDark = _createMaterialColor(Colors.blueAccent);
final _secondarySwatch = _createMaterialColor(Colors.deepOrange);
const _iconThemeData = const IconThemeData(color: Colors.white);

const String _fontFamily = 'Roboto';
const PageTransitionsTheme _transition = const PageTransitionsTheme(
  builders: {
    TargetPlatform.android: FadeTransitionBuilder(),
  },
);

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primarySwatch: _primarySwatchLight,
    primaryColor: _primarySwatchLight,
    chipTheme: ChipThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.white70,
      disabledColor: Colors.black45,
      selectedColor: _secondarySwatch[300],
      secondarySelectedColor: _secondarySwatch[100],
      padding: const EdgeInsets.all(5),
      shape: StadiumBorder(),
      labelStyle: _textThemeLight.bodyText2,
      secondaryLabelStyle: _textThemeLight.bodyText2,
      elevation: 3,
    ),
    accentColor: _primarySwatchLight[700],
    textTheme: _textThemeLight,
    primaryTextTheme: _primaryTextThemeLight,
    pageTransitionsTheme: _transition,
    fontFamily: _fontFamily,
    dividerColor: Colors.black26,
    disabledColor: Colors.black45,
    primaryIconTheme: _iconThemeData,
    iconTheme: _iconThemeData,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      actionsIconTheme: IconThemeData(color: _primarySwatchLight),
      iconTheme: _iconThemeData,
    ),
    buttonColor: _secondarySwatch[400],
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primarySwatch: _primarySwatchDark,
    primaryColor: _primarySwatchDark,
    chipTheme: ChipThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.grey,
      disabledColor: Colors.black45,
      selectedColor: _secondarySwatch[400],
      secondarySelectedColor: _secondarySwatch[200],
      padding: const EdgeInsets.all(5),
      shape: const StadiumBorder(),
      labelStyle: _textThemeDark.bodyText2,
      secondaryLabelStyle: _textThemeDark.bodyText2,
      elevation: 3,
    ),
    accentColor: _primarySwatchDark[700],
    textTheme: _textThemeDark,
    primaryTextTheme: _primaryTextThemeDark,
    pageTransitionsTheme: _transition,
    fontFamily: _fontFamily,
    dividerColor: Colors.white70,
    disabledColor: Colors.white70,
    primaryIconTheme: _iconThemeData,
    iconTheme: _iconThemeData,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      actionsIconTheme: IconThemeData(color: _primarySwatchDark),
    ),
    buttonColor: _secondarySwatch[400],
  ),
};

final _primaryTextThemeLight = TextTheme(
  bodyText1: TextStyle(
    fontSize: 18,
    color: Colors.white,
  ),
);

final _primaryTextThemeDark = TextTheme(
  bodyText1: TextStyle(
    fontSize: 18,
    color: Colors.black,
  ),
);

final _textThemeLight = TextTheme(
  headline1: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  headline2: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  headline3: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  headline4: TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  ),
  bodyText1: TextStyle(
    fontSize: 18,
    color: Colors.black,
  ),
  bodyText2: TextStyle(
    fontSize: 16,
    color: Colors.black,
  ),
);

final _textThemeDark = TextTheme(
  headline1: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  headline2: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  headline3: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  headline4: TextStyle(
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  ),
  bodyText1: TextStyle(
    fontSize: 18,
    color: Colors.white,
  ),
  bodyText2: TextStyle(
    fontSize: 16,
    color: Colors.white,
  ),
);
