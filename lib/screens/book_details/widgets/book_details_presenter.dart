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
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                _buildContentHeader(
                  context: context,
                  title: book.title,
                  author: book.author,
                ),
                if (book.description != null)
                  _buildDescription(context, book.description),
                SizedBox(height: 24),
                if (book.contents != null)
                  _buildTableOfContents(context, book.contents),
                Divider(
                  indent: 8,
                  endIndent: 8,
                  height: 54,
                  thickness: 2,
                ),
                _buildInfoTable(context, book),
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
          color: Theme.of(context).backgroundColor.withOpacity(0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                book.title ?? "(no title)",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              if (book.author != null)
                Text(
                  book.author,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentHeader({
    BuildContext context,
    String title,
    String author,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Column(
        children: [
          Text(
            title ?? "(no title)",
            style: Theme.of(context).primaryTextTheme.headline1,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14),
          if (author != null)
            Text(
              "by $author",
              style: Theme.of(context).primaryTextTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context, String description) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).backgroundColor,
      ),
      child: Column(
        children: [
          Text(
            "Decription",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 20),
          Html(
            data: "<div>$description</div>",
            style: {
              "div": Style(
                color: Theme.of(context).textTheme.bodyText2.color,
                fontSize: FontSize(
                  Theme.of(context).textTheme.bodyText2.fontSize,
                ),
                fontFamily: 'Roboto',
              ),
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTableOfContents(BuildContext context, String contents) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).backgroundColor,
      ),
      child: Column(
        children: [
          Text(
            "Table of Contents",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 20),
          Html(
            data: "<div>$contents</div>",
            style: {
              "div": Style(
                color: Theme.of(context).textTheme.bodyText2.color,
                fontSize: FontSize(
                  Theme.of(context).textTheme.bodyText2.fontSize,
                ),
                fontFamily: 'Roboto',
              ),
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTable(BuildContext context, BookModel book) {
    return Column(
      children: [
        Text(
          "Info",
          style: Theme.of(context).primaryTextTheme.headline1,
        ),
        SizedBox(height: 20),
        Table(
          columnWidths: {
            0: FractionColumnWidth(0.3),
            1: FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
          children: [
            _buildTableRow(context, "Title:", book.title),
            _buildTableRow(context, "Author(s):", book.author),
            _buildTableRow(context, "Year:", book.year),
            _buildTableRow(context, "Volume:", book.volumeInfo),
            _buildTableRow(context, "Series:", book.series),
            _buildTableRow(context, "Edition:", book.edition),
            _buildTableRow(context, "Publisher:", book.publisher),
            _buildTableRow(context, "City:", book.city),
            _buildTableRow(context, "Pages:", book.pages),
            _buildTableRow(context, "Language:", book.language),
            _buildTableRow(context, "ISBN:", book.isbn),
            _buildTableRow(context, "DOI:", book.doi),
            _buildTableRow(
              context,
              "File Size:",
              _buildFileSizeMessage(book.fileSize),
            ),
            _buildTableRow(context, "File Extension:", book.fileExtension),
          ],
        ),
      ],
    );
  }

  TableRow _buildTableRow(BuildContext context, String title, dynamic value) {
    return TableRow(
      children: [
        TableCell(
          child: Text(
            title,
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
        ),
        TableCell(
            child: value != null
                ? Container(
                    child: SelectableText(
                      value.toString(),
                      style: Theme.of(context).primaryTextTheme.bodyText1,
                    ),
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
