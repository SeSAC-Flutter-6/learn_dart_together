class Book implements Comparable<Book> {
  String title;
  String comment;
  DateTime publishDate;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate, comment: $comment}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate.year == other.publishDate.year &&
          publishDate.month == other.publishDate.month &&
          publishDate.day == other.publishDate.day;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode ^ comment.hashCode;

  Book copyWith({
    String? title,
    String? comment,
    DateTime? publishDate,
  }) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
      publishDate: publishDate ?? this.publishDate,
    );
  }

  @override
  int compareTo(Book other) {
    return -publishDate.compareTo(other.publishDate);
  }
}

void main() {
  Book a = Book(title: 'title', comment: 'comment');
  Book b = Book(
      title: 'title', comment: 'comment', publishDate: DateTime(2024, 6, 12));
  print(a.publishDate);
  print(b.publishDate);
  print(a == b);

  final books = [b, a];
  print(books.toString());
  books.sort();
  print(books.toString());
}
