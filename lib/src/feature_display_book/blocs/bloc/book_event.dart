abstract class BookEvent {
  const BookEvent();
}

class BookFetchEvent extends BookEvent {
  final int currentOffset;
  const BookFetchEvent(this.currentOffset);
}
