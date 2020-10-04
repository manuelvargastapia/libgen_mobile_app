import 'package:flutter/material.dart';

import 'blocs/book_block.dart';

class InheritedBlocs extends InheritedWidget {
  final Widget child;
  final BookBloc bookBloc;

  InheritedBlocs({Key key, this.bookBloc, this.child})
      : super(key: key, child: child);

  static InheritedBlocs of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<InheritedBlocs>());
  }

  @override
  bool updateShouldNotify(InheritedBlocs oldWidget) {
    return oldWidget.bookBloc.books != bookBloc.books;
  }
}
