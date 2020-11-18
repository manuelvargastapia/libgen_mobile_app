import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:libgen/src/feature_show_book_details/models/details_model.dart';
import 'package:libgen/src/feature_show_book_details/widgets/image_with_placeholder.dart';
import 'package:flutter_html/flutter_html.dart';

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
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            color: Colors.blueGrey[500],
            child: Column(
              children: [
                Text(
                  bookDetails.title ?? "(no title)",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14),
                if (bookDetails.author != null)
                  Text(
                    "by ${bookDetails.author}",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 24),
                if (bookDetails.description != null)
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Decription",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Html(
                          data: "<div>${bookDetails.description}</div>",
                          style: {
                            "div": Style(color: Colors.black),
                          },
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 24),
                if (bookDetails.contents != null)
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Table of Contents",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Html(
                          data: "<div>${bookDetails.contents}</div>",
                          style: {
                            "div": Style(color: Colors.black),
                          },
                        ),
                      ],
                    ),
                  ),
                Divider(
                  indent: 8,
                  endIndent: 8,
                  height: 54,
                  thickness: 2,
                  color: Colors.black26,
                ),
                Column(
                  children: [
                    Text(
                      "Info",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Table(
                      columnWidths: {
                        0: FractionColumnWidth(0.3),
                        1: FlexColumnWidth(),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.baseline,
                      children: [
                        TableRow(
                          children: [
                            Text(
                              "Title:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.title),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Author(s):",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.author),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Year:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.year),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Volume:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.volumeInfo),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Series:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.series),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Edition:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.edition),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Publisher:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.publisher),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "City:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.city),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Pages:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.pages),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Language:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.language),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "ISBN:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.isbn),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "DOI:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.doi),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "File Size:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.fileSize),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "File Extension:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(bookDetails.fileExtension),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget renderIfExists(dynamic value) {
  return value != null
      ? Container(
          child: SelectableText(value.toString()),
          padding: EdgeInsets.symmetric(vertical: 8),
        )
      : Container(
          padding: EdgeInsets.symmetric(vertical: 18),
        );
}
