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
        return ListTile(
          leading: Icon(Icons.history_rounded),
          title: Text(suggestions[index].query),
          onTap: () {
            onSelected(suggestions[index]);
          },
          trailing: IconButton(
            icon: Icon(
              Icons.close,
              size: 18,
            ),
            onPressed: () {
              hiveBloc.add(DeleteItemEvent<Suggestion>(index));
            },
          ),
        );
      },
    );
  }
}
