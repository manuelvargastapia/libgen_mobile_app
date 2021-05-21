import 'package:flutter/material.dart';
import 'package:libgen/domain/i_book_model.dart';
import 'package:libgen/screens/book_details/widgets/fiction_info_table.dart';
import 'package:libgen/screens/book_details/widgets/sci_tech_info_table.dart';
import 'package:simple_html_css/simple_html_css.dart';

import 'package:libgen/domain/book_sci_tech_model.dart';
import 'package:libgen/screens/book_details/widgets/expandable_text.dart';
import 'package:libgen/screens/book_details/widgets/image_with_placeholder.dart';
import 'package:libgen/generated/l10n.dart';

class BookDetailsPresenter extends StatelessWidget {
  final BookModel book;

  BookDetailsPresenter({@required this.book});

  Widget _buildDivider() {
    return Divider(indent: 8, endIndent: 8, height: 54, thickness: 2);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCover(context, book),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: [
                _buildContentHeader(
                  context: context,
                  title: book.title,
                  author: book.author,
                ),
                SizedBox(height: 24),
                if (book.description != null)
                  _buildContentSection(
                    context: context,
                    title: S.of(context).bookDetailsPresenterDescription,
                    content: book.description,
                  ),
                SizedBox(height: 24),
                if (book is BookSciTechModel)
                  if ((book as BookSciTechModel).contents != null)
                    _buildContentSection(
                      context: context,
                      title: S.of(context).bookDetailsPresenterTOC,
                      content: (book as BookSciTechModel).contents,
                    ),
                SizedBox(height: 24),
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
                book.title ?? S.of(context).bookDetailsPresenterNoTitle,
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
                  style: Theme.of(context).textTheme.bodyText1,
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
            title ?? S.of(context).bookDetailsPresenterNoTitle,
            style: Theme.of(context).textTheme.headline1,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 14),
          if (author != null)
            Text(
              S.of(context).bookDetailsPresenterByAuthor(author),
              style: Theme.of(context).textTheme.bodyText1,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }

  /// Returns a `TextSpan` widget.
  ///
  /// If `HTML.toTextSpan()` can't parse the String, a default `TextSpan` using
  /// the raw String is returned.
  TextSpan _generateTextSpanFromHTML(BuildContext context, String content) {
    TextSpan ts = TextSpan(
      text: content,
      style: Theme.of(context).textTheme.bodyText2,
    );
    try {
      ts = HTML.toTextSpan(
        context,
        "<div>$content</div>",
        defaultTextStyle: Theme.of(context).textTheme.bodyText2,
      );
    } catch (_) {}
    return ts;
  }

  Widget _buildContentSection({
    @required BuildContext context,
    @required String title,
    @required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          _buildDivider(),
          ExpandableText(_generateTextSpanFromHTML(context, content)),
        ],
      ),
    );
  }

  Widget _buildInfoTable(BuildContext context, BookModel book) {
    return Column(
      children: [
        Text(
          S.of(context).bookDetailsPresenterInfo,
          style: Theme.of(context).textTheme.headline1,
        ),
        _buildDivider(),
        book is BookSciTechModel
            ? SciTechInfoTable(book)
            : FictionInfoTable(book),
      ],
    );
  }
}
