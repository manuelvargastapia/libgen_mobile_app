import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'blocs/book_bloc.dart';
import 'data/book_repository.dart';
import 'screens/search_book/search_book_screen.dart';

class LibGenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookBloc(bookRepository: BookRepository()),
      child: MaterialApp(
        title: 'Lib Gen App',
        theme: ThemeData.dark(),
        home: FutureBuilder(
            future: Hive.openBox("suggestions"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return SearchBookScreen();
                }
              } else {
                return Scaffold();
              }
            }),
      ),
    );
  }
}
