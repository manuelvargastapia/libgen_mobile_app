import 'package:flutter/material.dart';

import 'package:libgen/blocs/book_bloc.dart';
import 'package:libgen/blocs/events/book_events.dart';
import 'package:libgen/domain/filters_extensions.dart';
import 'package:libgen/domain/filters_model.dart';
import 'package:libgen/domain/search_query_model.dart';

Future<FiltersModel> showFilterDialog({
  @required BuildContext context,
  @required String currentQuery,
  @required FiltersModel currentFilters,
  @required BookBloc bookBloc,
}) {
  FiltersModel _filters = currentFilters;

  return showDialog<FiltersModel>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Text("Filter"),
            actions: [
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop(_filters);
                },
              ),
              FlatButton(
                child: Text('Apply'),
                onPressed: () {
                  Navigator.of(context).pop(_filters);
                  if (currentQuery != '') {
                    bookBloc.add(
                      BookFetchEvent(
                        SearchQueryModel(
                          searchTerm: currentQuery,
                          filters: _filters,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 12, right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text("Sort by"),
                        ),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text("Sort by"),
                              items: SortBy.values
                                  .asMap()
                                  .entries
                                  .map((entry) => DropdownMenuItem(
                                        value: entry.value,
                                        child: Text(entry.value.displayUILabel),
                                      ))
                                  .toList(),
                              value: _filters.sortBy,
                              onChanged: (newValue) {
                                setState(() {
                                  _filters.sortBy = newValue;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text('Type'),
                        ),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              items: SearchIn.values
                                  .asMap()
                                  .entries
                                  .map((entry) => DropdownMenuItem(
                                        value: entry.value,
                                        child: Text(entry.value.displayUILabel),
                                      ))
                                  .toList(),
                              value: _filters.searchIn,
                              onChanged: (newValue) {
                                setState(() {
                                  _filters.searchIn = newValue;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8, right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text('Reverse order'),
                        ),
                        Checkbox(
                          value: _filters.reverseOrder,
                          onChanged: (bool value) {
                            setState(() {
                              _filters.reverseOrder = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
