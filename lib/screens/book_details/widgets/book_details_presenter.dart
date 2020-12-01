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
          _buildCover(context, book),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            color: Colors.blueGrey[500],
            child: Column(
              children: [
                _buildContentHeader(title: book.title, author: book.author),
                if (book.description != null)
                  _buildDescription(book.description),
                SizedBox(height: 24),
                if (book.contents != null) _buildTableOfContents(book.contents),
                Divider(
                  indent: 8,
                  endIndent: 8,
                  height: 54,
                  thickness: 2,
                  color: Colors.black26,
                ),
                _buildInfoTable(book),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCover(BuildContext context, BookModel book) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: ImageWidgetPlaceholder(
        image: book.coverUrl != null ? NetworkImage(book.coverUrl) : null,
        placeholder: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
    );
  }

  Widget _buildContentHeader({String title, String author}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Column(
        children: [
          Text(
            title ?? "(no title)",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14),
          if (author != null)
            Text(
              "by $author",
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Container(
      padding: const EdgeInsets.all(10),
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
            data: "<div>$description</div>",
            style: {
              "div": Style(color: Colors.black),
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTableOfContents(String contents) {
    return Container(
      padding: const EdgeInsets.all(10),
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
            data: "<div>$contents</div>",
            style: {
              "div": Style(color: Colors.black),
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTable(BookModel book) {
    return Column(
      children: [
        Text(
          "Info",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Table(
          columnWidths: {
            0: FractionColumnWidth(0.3),
            1: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
          children: [
            _buildTableRow("Title:", book.title),
            _buildTableRow("Author(s):", book.author),
            _buildTableRow("Year:", book.year),
            _buildTableRow("Volume:", book.volumeInfo),
            _buildTableRow("Series:", book.series),
            _buildTableRow("Edition:", book.edition),
            _buildTableRow("Publisher:", book.publisher),
            _buildTableRow("City:", book.city),
            _buildTableRow("Pages:", book.pages),
            _buildTableRow("Language:", book.language),
            _buildTableRow("ISBN:", book.isbn),
            _buildTableRow("DOI:", book.doi),
            _buildTableRow(
              "File Size:",
              _buildFileSizeMessage(book.fileSize),
            ),
            _buildTableRow("File Extension:", book.fileExtension),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableRow(String title, dynamic value) {
    return TableRow(
      children: [
        TableCell(
          child: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        TableCell(
            child: value != null
                ? Container(
                    child: SelectableText(value.toString()),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  )),
      ],
    );
  }

  String _buildFileSizeMessage(int fileSizeInBytes) {
    int kilobytes = fileSizeInBytes ~/ 1000;
    int megabytes = fileSizeInBytes ~/ 1000000;
    return "$megabytes MB ($kilobytes KB)";
  }
}
