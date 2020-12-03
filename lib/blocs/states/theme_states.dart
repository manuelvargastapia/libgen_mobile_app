import 'package:flutter/material.dart';

class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

class ThemeInitialState extends ThemeState {
  final ThemeData themeData;
  const ThemeInitialState(this.themeData) : super(themeData);
}
