import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

import 'package:libgen/generated/l10n.dart';

class ExpandableText extends StatelessWidget {
  final InlineSpan content;

  ExpandableText(this.content);

  bool _didExceedMaxLines(
    BuildContext context,
    InlineSpan text,
    BoxConstraints constraints,
  ) {
    final painter = TextPainter(
      text: text,
      textDirection: TextDirection.ltr,
      maxLines: 10,
    );
    painter.layout(maxWidth: constraints.maxWidth);
    return painter.didExceedMaxLines;
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: ExpandableThemeData(
        animationDuration: const Duration(milliseconds: 500),
        crossFadePoint: 0,
      ),
      child: ExpandableNotifier(
        child: Expandable(
          collapsed: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    text: content,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                  ),
                  SizedBox(height: 20),
                  if (_didExceedMaxLines(context, content, constraints))
                    ExpandableButton(
                      child: Text(
                        S.of(context).expandableTextShowMore,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Theme.of(context).buttonColor),
                      ),
                    ),
                ],
              );
            },
          ),
          expanded: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: content,
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
              SizedBox(height: 20),
              ExpandableButton(
                child: Text(
                  S.of(context).expandableTextShowLess,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Theme.of(context).buttonColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
