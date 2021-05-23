import 'package:flutter/material.dart';
import 'package:libgen/domain/book_fiction_model.dart';
import 'package:libgen/generated/l10n.dart';

class FictionInfoTable extends StatelessWidget {
  final BookFictionModel book;

  FictionInfoTable(this.book);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: {
        0: FractionColumnWidth(0.3),
        1: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        _buildTableRow(context, S.of(context).infoTableTitle, book.title),
        _buildTableRow(context, S.of(context).infoTableAuthor, book.author),
        _buildTableRow(context, S.of(context).infoTableYear, book.year),
        _buildTableRow(context, S.of(context).infoTableSeries, book.series),
        _buildTableRow(
          context,
          S.of(context).infoTablePublisher,
          book.publisher,
        ),
        _buildTableRow(context, S.of(context).infoTableLanguage, book.language),
        _buildTableRow(context, S.of(context).infoTableISBN, book.isbn),
        _buildTableRow(
          context,
          S.of(context).infoTableFileExtension,
          book.fileExtension,
        ),
        _buildTableRow(context, S.of(context).infoTableFileSize, book.fileSize)
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
}
