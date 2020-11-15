import 'package:flutter/material.dart';
import 'package:libgen/src/feature_show_book_details/models/details_model.dart';
import 'package:transparent_image/transparent_image.dart';

class BookDetailsPresenter extends StatelessWidget {
  final DetailsModel bookDetails;

  BookDetailsPresenter({@required this.bookDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (bookDetails.coverUrl != null)
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.dstATop,
                      ),
                      image: NetworkImage(bookDetails.coverUrl, scale: 10),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: bookDetails.coverUrl,
                    fit: BoxFit.contain,
                    imageErrorBuilder: (context, object, stackStrace) => Icon(
                      Icons.broken_image,
                      size: 50,
                    ),
                  ),
                ),
              ],
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
