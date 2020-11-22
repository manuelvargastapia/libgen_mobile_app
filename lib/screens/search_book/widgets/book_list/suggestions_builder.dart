import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/hive_bloc.dart';
import 'package:libgen/blocs/events/hive_event.dart';
import 'package:libgen/blocs/states/hive_state.dart';
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
    return BlocConsumer<HiveBloc<Suggestion>, HiveState>(
      listener: (context, hiveState) {
        if (hiveState is HiveSuccessState && hiveState.data != null) {
          suggestions.clear();
          suggestions.addAll(hiveState.data);
        }
      },
      builder: (context, hiveState) {
        if (hiveState is HiveErrorState) {
          return Container();
        }
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
      },
    );
  }
}
