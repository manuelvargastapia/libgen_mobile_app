import 'package:flutter/material.dart';
import 'package:libgen/src/inherited_blocs.dart';

import '../models/result.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          title: Text("Library Genesis"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: BookSearchDelegate());
              },
            )
          ],
        ),
      ],
    ));
  }

  Widget buildList(AsyncSnapshot<Result> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.bookList.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(snapshot.data.bookList[index].title);
      },
    );
  }
}

class BookSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 4) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than four letters.",
            ),
          )
        ],
      );
    }

    InheritedBlocs.of(context).bookBloc.fetchBooks(query);

    return Column(
      children: [
        StreamBuilder(
          stream: InheritedBlocs.of(context).bookBloc.books,
          builder: (context, AsyncSnapshot<Result> snapshot) {
            if (!snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else if (snapshot.data.bookList.length == 0) {
              return Column(
                children: <Widget>[
                  Text(
                    "No Results Found.",
                  ),
                ],
              );
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.bookList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data.bookList[index].title),
                    );
                  });
            }
          },
        )
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
