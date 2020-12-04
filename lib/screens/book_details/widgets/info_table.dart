import 'package:flutter/material.dart';
import 'package:libgen/domain/book_model.dart';

class InfoTable extends StatelessWidget {
  final BookModel book;

  InfoTable(this.book);

  @override
  Widget build(BuildContext context) {
    return Table(
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
    );
  }

  TableRow _buildTableRow(BuildContext context, String title, dynamic value) {
    return TableRow(
      children: [
        TableCell(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        TableCell(
            child: value != null
                ? Container(
                    child: SelectableText(
                      value.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
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
