import 'package:flutter/material.dart';

import 'package:libgen/blocs/book_bloc.dart';
import 'package:libgen/blocs/events/book_events.dart';
import 'package:libgen/domain/filters_extensions.dart';
import 'package:libgen/domain/filters_sci_tech_model.dart';
import 'package:libgen/domain/i_filters_model.dart';
import 'package:libgen/domain/search_query_model.dart';
import 'package:libgen/global/widgets/custom_alert_dialog.dart';
import 'package:libgen/generated/l10n.dart';

Future<FiltersModel> showSciTechFilterDialog({
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
          return CustomAlertDialog(
            title: S.of(context).showFilterDialogTitle,
            textLeft: S.of(context).showFilterDialogCancel,
            textRight: S.of(context).showFilterDialogApply,
            callbacLeft: () {
              Navigator.of(context).pop(_filters);
            },
            callbackRight: () {
              Navigator.of(context).pop(_filters);
              if (currentQuery != '') {
                bookBloc.add(
                  BookFetchSciTechEvent(
                    SearchQueryModel(
                      searchTerm: currentQuery,
                      filters: _filters,
                    ),
                  ),
                );
              }
            },
            content: SingleChildScrollView(
              child: Column(
                children: [
                  _buildDropdownFilter<SearchIn>(
                    context: context,
                    title: S.of(context).showFilterDialogSearchInLabel,
                    selectedValue: _filters.searchIn,
                    values: SearchIn.values,
                    labelGenerator: (value) => Text(
                      value.displayUILabel(context),
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                    ),
                    callback: (value) {
                      setState(() {
                        _filters = FiltersSciTechModel(
                          searchIn: value,
                          sortBy: _filters.sortBy,
                        );
                      });
                    },
                  ),
                  _buildDropdownFilter<SortBy>(
                    context: context,
                    title: S.of(context).showFilterDialogSortByLabel,
                    selectedValue: _filters.sortBy,
                    values: SortBy.values,
                    labelGenerator: (value) => Text(
                      value.displayUILabel(context),
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                    ),
                    callback: (value) {
                      setState(() {
                        _filters = FiltersSciTechModel(
                          searchIn: _filters.searchIn,
                          sortBy: value,
                        );
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  _buildChipFilter(
                    context: context,
                    selectedIndex:
                        (_filters as FiltersSciTechModel).reverseOrder.index,
                    currentSortBy: _filters.sortBy,
                    callback: (bool value, int index) {
                      setState(() {
                        if (value) {
                          _filters = FiltersSciTechModel(
                            reverseOrder: ReverseOrder.values[index],
                            searchIn: _filters.searchIn,
                            sortBy: _filters.sortBy,
                          );
                        }
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

Widget _buildDropdownFilter<T>({
  @required BuildContext context,
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
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
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

Widget _buildChipFilter({
  @required BuildContext context,
  @required int selectedIndex,
  @required void Function(bool value, int index) callback,
  @required SortBy currentSortBy,
}) {
  if (currentSortBy == SortBy.def) return Container();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: List.generate(2, (index) {
      return Expanded(
        child: ChoiceChip(
          label: Text(
            currentSortBy.displaySortingLabel(context, index),
            maxLines: 1,
          ),
          selected: selectedIndex == index,
          onSelected: (value) {
            callback(value, index);
          },
        ),
      );
    }).toList(),
  );
}
