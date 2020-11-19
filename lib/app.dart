import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:libgen/blocs/download_bloc.dart';

import 'package:libgen/blocs/hive_bloc.dart';
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
                    repository: SuggestionRepository(
                      snapshot.data,
                    ),
                  ),
                ),
                BlocProvider(
                  create: (context) => DownloadBloc(
                    bookRepository: BookRepository(),
                  ),
                ),
              ],
              child: MaterialApp(
                title: 'Lib Gen App',
                theme: ThemeData.dark(),
                home: SearchBookScreen(),
              ));
        });
  }
}
