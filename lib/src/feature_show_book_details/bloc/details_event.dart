abstract class DetailsEvent {
  const DetailsEvent();
}

class DetailsFetchEvent extends DetailsEvent {
  final int bookId;
  const DetailsFetchEvent(this.bookId);
}
