import 'package:flutter/widgets.dart';

abstract class BookEvent {
  const BookEvent();
}

class BookFetchEvent extends BookEvent {
  final int currentOffset;
  final String query;
  const BookFetchEvent({@required this.currentOffset, @required this.query});
}

class DownloadBookEvent extends BookEvent {
  final String md5;
  const DownloadBookEvent(this.md5);
}
