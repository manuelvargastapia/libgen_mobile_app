import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:libgen/blocs/book_bloc.dart';
import 'package:libgen/blocs/events/book_events.dart';
import 'package:libgen/blocs/fiction_languages_bloc.dart';
import 'package:libgen/blocs/states/fiction_languages_states.dart';
import 'package:libgen/domain/fiction_filters_extensions.dart';
import 'package:libgen/domain/filters_fiction_model.dart';
import 'package:libgen/domain/search_query_model.dart';
import 'package:libgen/global/widgets/custom_alert_dialog.dart';
import 'package:libgen/generated/l10n.dart';

Future<FiltersFictionModel> showFictionFilterDialog({
  @required BuildContext context,
  @required String currentQuery,
  @required FiltersFictionModel currentFilters,
  @required BookBloc bookBloc,
}) {
  FiltersFictionModel _filters = currentFilters;

  return showDialog<FiltersFictionModel>(
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
                  BookFetchFictionEvent(
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
                        _filters = FiltersFictionModel(
                          searchIn: value,
                          language: _filters.language,
                          fileExtension: _filters.fileExtension,
                          wildcardWords: _filters.wildcardWords,
                        );
                      });
                    },
                  ),
                  BlocBuilder<FictionLanguagesBloc, FictionLanguagesState>(
                    builder: (context, state) {
                      if (state is FictionLanguagesSuccessState) {
                        return _buildDropdownFilter<String>(
                          context: context,
                          title: S.of(context).showFilterDialogLanguageLabel,
                          selectedValue: _filters.language,
                          values: state.languages,
                          labelGenerator: (value) => Text(
                            value == 'def'
                                ? S.of(context).filtersExtensionsAll
                                : value,
                            style: Theme.of(context).textTheme.bodyText1,
                            maxLines: 1,
                          ),
                          callback: (value) {
                            setState(() {
                              _filters = FiltersFictionModel(
                                language: value,
                                fileExtension: _filters.fileExtension,
                                searchIn: _filters.searchIn,
                                wildcardWords: _filters.wildcardWords,
                              );
                            });
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                  _buildDropdownFilter<Extension>(
                    context: context,
                    title: S.of(context).showFilterDialogExtensionLabel,
                    selectedValue: _filters.fileExtension,
                    values: Extension.values,
                    labelGenerator: (value) => Text(
                      value.displayUILabel(context),
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: 1,
                    ),
                    callback: (value) {
                      setState(() {
                        _filters = FiltersFictionModel(
                          fileExtension: value,
                          language: _filters.language,
                          searchIn: _filters.searchIn,
                          wildcardWords: _filters.wildcardWords,
                        );
                      });
                    },
                  ),
                  _buildCheckboxFilter(
                    context: context,
                    title: S.of(context).showFilterDialogWildcardWordsLabel,
                    value: _filters.wildcardWords.value,
                    callback: (value) {
                      setState(
                        () {
                          _filters = FiltersFictionModel(
                            wildcardWords:
                                value ? WildcardWords.yes : WildcardWords.no,
                            fileExtension: _filters.fileExtension,
                            language: _filters.language,
                            searchIn: _filters.searchIn,
                          );
                        },
                      );
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

Widget _buildCheckboxFilter({
  @required BuildContext context,
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
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
          child: Checkbox(
            value: value,
            onChanged: callback, //Theme.of(context).accentColor,
          ),
        ),
      ],
    ),
  );
}
