import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:libgen/blocs/download_bloc.dart';
import 'package:libgen/blocs/hive_bloc.dart';
import 'package:libgen/blocs/theme_cubit.dart';
import 'package:libgen/data/download_repository.dart';
import 'package:libgen/data/hive_repositories/suggestion_repository.dart';
import 'package:libgen/domain/suggestion.dart';
import 'package:libgen/global/theme/themes.dart';
import 'package:libgen/screens/search_book/sci_tech_search_book_screen.dart';
import 'package:package_info/package_info.dart';
import 'blocs/book_bloc.dart';
import 'blocs/states/theme_states.dart';
import 'data/book_repository.dart';
import 'generated/l10n.dart';

class LibGenApp extends StatelessWidget {
  final PackageInfo packageInfo;

  LibGenApp(this.packageInfo);

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
              BlocProvider(create: (context) => ThemeCubit()),
            ],
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) => MaterialApp(
                title: packageInfo.appName,
                debugShowCheckedModeBanner: false,
                theme: appThemeData[themeState.appTheme],
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: SciTechSearchBookScreen(packageInfo),
              ),
            ),
          );
        });
  }
}
