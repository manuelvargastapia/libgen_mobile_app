import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class ExpandableText extends StatelessWidget {
  final InlineSpan content;

  ExpandableText(this.content);

  @override
  Widget build(BuildContext context) {
    return ExpandableTheme(
      data: ExpandableThemeData(
        animationDuration: const Duration(milliseconds: 500),
        crossFadePoint: 0,
      ),
      child: ExpandableNotifier(
        child: Expandable(
          collapsed: Column(
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
              ExpandableButton(
                child: Text(
                  "Show more",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
            ],
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
                "Show less",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Theme.of(context).primaryColor),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
