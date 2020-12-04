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
            title: Text(
              "Filter",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            actions: _buildAlertDialogActions(
              context: context,
              filters: _filters,
              bookBloc: bookBloc,
              currentQuery: currentQuery,
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  _buildDropdownFilter<SearchIn>(
                    title: "Search in",
                    selectedValue: _filters.searchIn,
                    values: SearchIn.values,
                    labelGenerator: (value) => Text(value.displayUILabel),
                    callback: (value) {
                      setState(() {
                        _filters = FiltersModel(
                          reverseOrder: _filters.reverseOrder,
                          searchIn: value,
                          sortBy: _filters.sortBy,
                        );
                      });
                    },
                  ),
                  _buildDropdownFilter<SortBy>(
                    title: 'Sort by',
                    selectedValue: _filters.sortBy,
                    values: SortBy.values,
                    labelGenerator: (value) => Text(value.displayUILabel),
                    callback: (value) {
                      setState(() {
                        _filters = FiltersModel(
                          reverseOrder: _filters.reverseOrder,
                          searchIn: _filters.searchIn,
                          sortBy: value,
                        );
                      });
                    },
                  ),
                  _buildCheckboxFilter(
                    title: 'Reverse order',
                    value: _filters.reverseOrder,
                    callback: (bool value) {
                      setState(() {
                        _filters = FiltersModel(
                          reverseOrder: value,
                          searchIn: _filters.searchIn,
                          sortBy: _filters.sortBy,
                        );
                      });
                    },
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

List<Widget> _buildAlertDialogActions({
  @required BuildContext context,
  @required FiltersModel filters,
  @required BookBloc bookBloc,
  @required String currentQuery,
}) {
  return [
    FlatButton(
      child: Text('Cancel'),
      onPressed: () {
        Navigator.of(context).pop(filters);
      },
    ),
    FlatButton(
      child: Text('Apply'),
      onPressed: () {
        Navigator.of(context).pop(filters);
        if (currentQuery != '') {
          bookBloc.add(
            BookFetchEvent(
              SearchQueryModel(
                searchTerm: currentQuery,
                filters: filters,
              ),
            ),
          );
        }
      },
    ),
  ];
}

Widget _buildDropdownFilter<T>({
  @required String title,
  @required T selectedValue,
  @required List<T> values,
  @required void Function(T value) callback,
  @required Text Function(T value) labelGenerator,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 8, right: 10),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(title),
        ),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              isExpanded: true,
              items: values
                  .asMap()
                  .entries
                  .map((entry) => DropdownMenuItem<T>(
                        value: entry.value,
                        child: labelGenerator(entry.value),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: callback,
            ),
          ),
        )
      ],
    ),
  );
}

Widget _buildCheckboxFilter({
  @required String title,
  @required bool value,
  @required void Function(bool value) callback,
}) {
  return Container(
    padding: const EdgeInsets.only(top: 8, right: 10),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(title),
        ),
        Checkbox(
          value: value,
          onChanged: callback,
        ),
      ],
    ),
  );
}
