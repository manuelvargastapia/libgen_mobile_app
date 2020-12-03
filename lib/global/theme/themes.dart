import 'package:flutter/material.dart';

enum AppTheme { BlueLight, BlueDark }

const Color _primaryColor = Color(0xFF548cd4);

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.BlueLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: _primaryColor,
  ),
  AppTheme.BlueDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: _primaryColor,
  ),
};
