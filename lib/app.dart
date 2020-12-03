import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:libgen/blocs/download_bloc.dart';
import 'package:libgen/blocs/hive_bloc.dart';
import 'package:libgen/blocs/theme_bloc.dart';
import 'package:libgen/data/download_repository.dart';
import 'package:libgen/data/hive_repositories/suggestion_repository.dart';
import 'package:libgen/domain/suggestion.dart';
import 'package:libgen/global/theme/themes.dart';
import 'blocs/book_bloc.dart';
import 'blocs/states/theme_states.dart';
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
              BlocProvider(create: (context) => ThemeBloc()),
            ],
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, themeState) => MaterialApp(
                title: 'LibGen',
                debugShowCheckedModeBanner: false,
                theme: appThemeData[themeState.appTheme],
                home: SearchBookScreen(),
              ),
            ),
          );
        });
  }
}
