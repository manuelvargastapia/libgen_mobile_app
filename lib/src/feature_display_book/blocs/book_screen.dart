import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libgen/src/feature_display_book/blocs/bloc/book_bloc.dart';
import 'package:libgen/src/feature_display_book/blocs/bloc/book_event.dart';
import 'package:libgen/src/feature_display_book/blocs/repository/book_repository.dart';
import 'package:libgen/src/feature_display_book/blocs/widgets/book_body.dart';

class DisplayBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BookBloc(bookRepository: BookRepository())..add(BookFetchEvent(0)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lib Gen App'),
        ),
        body: BookBody(),
      ),
    );
  }
}
