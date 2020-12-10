import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title, textLeft, textRight;
  final Widget content;
  final Function callbacLeft, callbackRight;

  CustomAlertDialog({
    @required this.textRight,
    @required this.callbackRight,
    @required this.content,
    this.textLeft,
    this.callbacLeft,
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
        if (textLeft != null && callbacLeft != null)
          FlatButton(
            child: Text(
              textLeft,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            onPressed: () {
              callbacLeft();
            },
          ),
        FlatButton(
          child: Text(
            textRight,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          onPressed: () {
            callbackRight();
          },
        ),
      ],
      content: content,
      scrollable: true,
    );
  }
}
