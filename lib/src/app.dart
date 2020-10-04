import 'package:flutter/material.dart';

import 'blocs/book_block.dart';
import 'inherited_blocs.dart';
import 'ui/book_list.dart';

class LibGen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InheritedBlocs(
        bookBloc: bookBloc,
        child: MaterialApp(
          home: Scaffold(body: BookList()),
        ));
  }
}
