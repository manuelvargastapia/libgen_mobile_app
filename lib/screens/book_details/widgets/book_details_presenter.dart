import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:libgen/domain/book_model.dart';

import 'package:libgen/screens/book_details/widgets/image_with_placeholder.dart';

class BookDetailsPresenter extends StatelessWidget {
  final BookModel book;

  BookDetailsPresenter({@required this.book});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: ImageWidgetPlaceholder(
              image: NetworkImage(book.coverUrl),
              placeholder: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                color: Colors.white.withOpacity(0.2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      book.title ?? "(no title)",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (book.author != null)
                      Text(
                        book.author,
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
                  book.title ?? "(no title)",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 14),
                if (book.author != null)
                  Text(
                    "by ${book.author}",
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 24),
                if (book.description != null)
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
                          data: "<div>${book.description}</div>",
                          style: {
                            "div": Style(color: Colors.black),
                          },
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 24),
                if (book.contents != null)
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
                          data: "<div>${book.contents}</div>",
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
                            renderIfExists(book.title),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Author(s):",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.author),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Year:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.year),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Volume:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.volumeInfo),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Series:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.series),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Edition:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.edition),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Publisher:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.publisher),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "City:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.city),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Pages:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.pages),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Language:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.language),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "ISBN:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.isbn),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "DOI:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.doi),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "File Size:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.fileSize),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "File Extension:",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            renderIfExists(book.fileExtension),
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
