import 'package:flutter/material.dart';

import 'package:libgen/global/navigation/fade_transition_builder.dart';

enum AppTheme { BlueLight, BlueDark }

const Color _primaryColorLight = Color(0xFF548cd4);
const Color _accentColorLight = Color(0xFFE0E0E0);
const Color _primaryColorDark = Colors.blueAccent;
const Color _accentColorDark = Color(0xFF303030);
const String _fontFamily = 'Roboto';
const PageTransitionsTheme _transition = const PageTransitionsTheme(
  builders: {
    TargetPlatform.android: FadeTransitionBuilder(),
  },
);

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: _primaryColorLight,
    accentColor: _accentColorLight,
    buttonColor: Colors.white,
    dividerColor: Colors.black26,
    disabledColor: Colors.black45,
    backgroundColor: Colors.white,
    primaryIconTheme: IconThemeData(color: Colors.black),
    fontFamily: _fontFamily,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _primaryColorLight,
    ),
    textTheme: _textThemeLight,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      actionsIconTheme: IconThemeData(color: _primaryColorLight),
    ),
    toggleableActiveColor: _primaryColorLight,
    pageTransitionsTheme: _transition,
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: _primaryColorDark,
    accentColor: _accentColorDark,
    buttonColor: Colors.white,
    dividerColor: Colors.white70,
    disabledColor: Colors.white70,
    backgroundColor: Colors.black,
    primaryIconTheme: IconThemeData(color: Colors.white),
    fontFamily: _fontFamily,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _primaryColorDark,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: _textThemeDark,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      actionsIconTheme: IconThemeData(color: _primaryColorDark),
    ),
    toggleableActiveColor: _primaryColorDark,
    pageTransitionsTheme: _transition,
  ),
};

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
