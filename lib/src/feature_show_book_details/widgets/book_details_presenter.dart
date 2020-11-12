import 'package:flutter/material.dart';
import 'package:libgen/src/feature_show_book_details/models/details_model.dart';

class BookDetailsPresenter extends StatelessWidget {
  final DetailsModel bookDetails;

  BookDetailsPresenter({@required this.bookDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          bookDetails.coverUrl == null
              ? Container(
                  child: Text("No image"),
                  height: MediaQuery.of(context).size.height / 2,
                )
              : Image.network(
                  bookDetails.coverUrl,
                  loadingBuilder: (context, widget, imageChunkEvent) {
                    return imageChunkEvent == null
                        ? widget
                        : CircularProgressIndicator();
                  },
                  height: MediaQuery.of(context).size.height / 2,
                ),
          renderIfExists(value: bookDetails.title),
          renderIfExists(value: bookDetails.author),
          renderIfExists(value: bookDetails.year),
          renderIfExists(value: bookDetails.volumeInfo),
          renderIfExists(value: bookDetails.series),
          renderIfExists(value: bookDetails.edition),
          renderIfExists(value: bookDetails.publisher),
          renderIfExists(value: bookDetails.city),
          renderIfExists(value: bookDetails.pages),
          renderIfExists(value: bookDetails.language),
          renderIfExists(value: bookDetails.isbn),
          renderIfExists(value: bookDetails.doi),
          renderIfExists(value: bookDetails.fileSize),
          renderIfExists(value: bookDetails.fileExtension),
          renderIfExists(value: bookDetails.description),
          renderIfExists(value: bookDetails.contents),
        ],
      ),
    );
  }
}

Widget renderIfExists({@required dynamic value}) {
  return value != null
      ? Text(value.toString())
      : Container(
          height: 40,
        );
}
