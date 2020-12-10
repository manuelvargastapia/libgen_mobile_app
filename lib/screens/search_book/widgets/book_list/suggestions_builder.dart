import 'package:flutter/material.dart';

import 'package:libgen/blocs/hive_bloc.dart';
import 'package:libgen/blocs/events/hive_event.dart';
import 'package:libgen/domain/suggestion.dart';

class SuggestionsBuilder extends StatelessWidget {
  final List<Suggestion> suggestions;
  final void Function(Suggestion suggestion) onSelected;
  final HiveBloc hiveBloc;

  SuggestionsBuilder({
    @required this.onSelected,
    @required this.hiveBloc,
    this.suggestions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final reversedIndex = suggestions.length - index - 1;
        return ListTile(
          leading: Icon(
            Icons.history_rounded,
            size: 18,
            color: Theme.of(context).accentIconTheme.color,
          ),
          title: Text(
            suggestions[reversedIndex].query,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: Theme.of(context).accentIconTheme.color,
                ),
          ),
          onTap: () {
            onSelected(suggestions[reversedIndex]);
          },
          trailing: IconButton(
            icon: Icon(
              Icons.close,
              size: 18,
              color: Theme.of(context).accentIconTheme.color,
            ),
            onPressed: () {
              hiveBloc.add(DeleteItemEvent<Suggestion>(reversedIndex));
            },
          ),
        );
      },
    );
  }
}
