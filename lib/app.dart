import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:libgen/blocs/download_bloc.dart';
import 'package:libgen/blocs/hive_bloc.dart';
import 'package:libgen/data/download_repository.dart';
import 'package:libgen/data/hive_repositories/suggestion_repository.dart';
import 'package:libgen/domain/suggestion.dart';
import 'blocs/book_bloc.dart';
import 'data/book_repository.dart';
import 'screens/search_book/search_book_screen.dart';

class LibGenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Hive.openBox<Suggestion>("suggestions"),
        builder: (context, snapshot) {
          return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => BookBloc(
                    bookRepository: BookRepository(),
                  ),
                ),
                BlocProvider(
                  create: (context) => HiveBloc<Suggestion>(
                    box: snapshot.data,
                    repository: SuggestionRepository(),
                  ),
                ),
                BlocProvider(
                  create: (context) => DownloadBloc(
                    bookRepository: BookRepository(),
                    downloadRepository: DownloadRepository(),
                  ),
                ),
              ],
              child: MaterialApp(
                title: 'LibGen',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  brightness: Brightness.light,
                  primaryColor: Color(0xFF548cd4),
                  accentColor: Colors.lightBlue[200],
                  dividerColor: Colors.black26,
                  disabledColor: Colors.black45,
                  backgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                    brightness: Brightness.light,
                    centerTitle: false,
                    color: Color(0xFF548cd4),
                    actionsIconTheme: IconThemeData(color: Color(0xFF548cd4)),
                  ),
                  fontFamily: 'Roboto',
                  primaryTextTheme: TextTheme(
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
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    bodyText2: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  textTheme: TextTheme(
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
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    bodyText2: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
                home: SearchBookScreen(),
              ));
        });
  }
}
