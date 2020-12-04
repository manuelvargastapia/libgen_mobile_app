import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title, textLeft, textRight;
  final Widget content;
  final Function callbacLeft, callbackRight;

  CustomAlertDialog({
    @required this.textLeft,
    @required this.callbacLeft,
    @required this.textRight,
    @required this.callbackRight,
    @required this.content,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null
          ? Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            )
          : null,
      actions: [
        FlatButton(
          child: Text(
            textLeft,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onPressed: () {
            callbacLeft();
          },
        ),
        FlatButton(
          child: Text(
            textRight,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          onPressed: () {
            callbackRight();
          },
        ),
      ],
      content: content,
    );
  }
}
