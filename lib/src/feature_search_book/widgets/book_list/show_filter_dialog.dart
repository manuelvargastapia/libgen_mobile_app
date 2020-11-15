import 'package:flutter/material.dart';
import 'package:libgen/src/feature_search_book/bloc/book_bloc.dart';
import 'package:libgen/src/feature_search_book/bloc/book_event.dart';
import 'package:libgen/src/feature_search_book/models/filters_model.dart';
import 'package:libgen/src/feature_search_book/models/search_query_model.dart';

Future<FiltersModel> showFilterDialog({
  @required BuildContext context,
  @required String currentQuery,
  @required FiltersModel currentFilters,
  @required BookBloc bookBloc,
}) {
  Map<String, String> _sortByValues = {
    'def': 'Relevance',
    'title': 'Title',
    'year': 'Year',
    'pages': 'Pages',
    'filesize': 'File size',
  };

  Map<String, String> _searchInValues = {
    'def': 'All',
    'title': 'Title',
    'author': 'Author',
    'series': 'Series',
    'publisher': 'Publisher',
    'identifier': 'ISBN',
    'md5': 'MD5',
  };

  String _sortBy = _sortByValues[currentFilters.sortBy];
  String _searchIn = _searchInValues[currentFilters.searchIn];
  bool _reverseOrder = currentFilters.reverseOrder;

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
                  Navigator.of(context).pop(FiltersModel(
                    sortBy: currentFilters.sortBy,
                    searchIn: currentFilters.searchIn,
                    reverseOrder: currentFilters.reverseOrder,
                  ));
                },
              ),
              FlatButton(
                child: Text('Apply'),
                onPressed: () {
                  String sortByKey = _sortByValues.keys.firstWhere(
                    (key) => _sortByValues[key] == _sortBy,
                    orElse: () => null,
                  );
                  String searchInKey = _searchInValues.keys.firstWhere(
                    (key) => _searchInValues[key] == _searchIn,
                    orElse: () => null,
                  );
                  Navigator.of(context).pop(
                    FiltersModel(
                      sortBy: sortByKey,
                      searchIn: searchInKey,
                      reverseOrder: _reverseOrder,
                    ),
                  );
                  if (currentQuery != '') {
                    bookBloc.add(
                      BookFetchEvent(
                        SearchQueryModel(
                          searchTerm: currentQuery,
                          filters: FiltersModel(
                            searchIn: searchInKey,
                            sortBy: sortByKey,
                            reverseOrder: _reverseOrder,
                          ),
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
                    padding: EdgeInsets.only(top: 12, right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Text("Sort by"),
                        ),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text("Sort by"),
                              items: _sortByValues.values
                                  .map(
                                    (String value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                              value: _sortBy,
                              onChanged: (String newValue) {
                                setState(() {
                                  _sortBy = newValue;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Text('Type'),
                        ),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              items: _searchInValues.values
                                  .map(
                                    (String value) => DropdownMenuItem(
                                      value: value,
                                      child: Text(value),
                                    ),
                                  )
                                  .toList(),
                              value: _searchIn,
                              onChanged: (String newValue) {
                                setState(() {
                                  _searchIn = newValue;
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, right: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Text('Reverse order'),
                        ),
                        Checkbox(
                          value: _reverseOrder,
                          onChanged: (bool value) {
                            setState(() {
                              _reverseOrder = value;
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
