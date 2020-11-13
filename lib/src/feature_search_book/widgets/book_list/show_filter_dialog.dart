import 'package:flutter/material.dart';

Future<void> showFilterDialog(
  BuildContext context,
  void Function(String newSearchIn, String newSortBy) updateStateCallback,
) {
  Map<String, String> _sortByValues = {
    'def': 'Relevance',
    'title': 'Title',
    'publisher': 'Publisher',
    'year': 'Year',
    'pages': 'Pages',
    'language': 'Language',
    'filesize': 'File size',
    'extension': 'File extension',
  };

  Map<String, String> _searchInValues = {
    'def': 'All',
    'title': 'Title',
    'author': 'Author',
    'series': 'Series',
    'publisher': 'Publisher',
    'year': 'Year',
    'identifier': 'ISBN',
    'md5': 'MD5',
    'extension': 'File extension'
  };

  String _sortBy = _sortByValues['def'];
  String _searchIn = _searchInValues['def'];

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: Center(child: Text("Filter")),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 12, right: 10),
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
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Text('Search in'),
                        ),
                        Expanded(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              isExpanded: true,
                              hint: Text("Search in"),
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
                  Center(
                    child: RaisedButton(
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
                          updateStateCallback(searchInKey, sortByKey);
                        }),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
