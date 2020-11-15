import 'package:flutter/material.dart';
import 'package:libgen/src/feature_show_book_details/models/details_model.dart';
import 'package:libgen/src/feature_show_book_details/widgets/image_with_placeholder.dart';

class BookDetailsPresenter extends StatelessWidget {
  final DetailsModel bookDetails;

  BookDetailsPresenter({@required this.bookDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: ImageWidgetPlaceholder(
              image: NetworkImage(bookDetails.coverUrl),
              placeholder: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                color: Colors.white.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bookDetails.title ?? "(no title)",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (bookDetails.author != null)
                      Text(
                        bookDetails.author,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14),
                      ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
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
