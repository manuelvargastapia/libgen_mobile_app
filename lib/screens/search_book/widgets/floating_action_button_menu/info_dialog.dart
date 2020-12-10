import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:libgen/generated/l10n.dart';
import 'package:libgen/global/widgets/custom_alert_dialog.dart';

void showInfoDialog({
  @required BuildContext context,
  @required Widget applicationIcon,
  @required String applicationName,
  @required String applicationLegalese,
  @required String applicationVersion,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomAlertDialog(
        content: ListBody(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconTheme(
                  data: Theme.of(context).iconTheme,
                  child: applicationIcon,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ListBody(
                      children: <Widget>[
                        Text(
                          applicationName,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Text(
                          applicationVersion,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          applicationLegalese,
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        textRight: S.of(context).infoDialogAlertDialogRightButtonText,
        callbackRight: () {
          Navigator.pop(context);
        },
      );
    },
  );
}
