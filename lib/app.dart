import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_search_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_search_book/search_book_screen.dart';
import 'package:libgen/src/feature_search_book/repository/book_repository.dart';

class LibGenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookBloc(bookRepository: BookRepository()),
      child: MaterialApp(
        title: 'Lib Gen App',
        theme: ThemeData.dark(),
        home: SearchBookScreen(),
      ),
    );
  }
}
