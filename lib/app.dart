import 'package:flutter/material.dart';
import 'package:libgen/src/feature_display_book/display_book_screen.dart';

class LibGenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lib Gen App',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {'/': (context) => DisplayBookScreen()},
    );
  }
}
