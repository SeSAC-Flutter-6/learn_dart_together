class Book extends Object implements Comparable {
  String title;
  DateTime publishDate;
  String comment;

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Book &&
            runtimeType == other.runtimeType &&
            title == other.title &&
            publishDate.toString().split(' ')[0] ==
                other.publishDate.toString().split(' ')[0];
  }

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
        title: title ?? this.title,
        publishDate: publishDate ?? this.publishDate,
        comment: comment ?? this.comment);
  }

  @override
  int compareTo(other) {
    return -publishDate.compareTo(other.publishDate);
  }
}

void main() {
  Book book1 = Book(
    title: 'title1',
    comment: 'comment1',
    publishDate: DateTime(2024, 1, 1),
  );
  Book book2 = Book(
    title: 'title2',
    comment: 'comment2',
    publishDate: DateTime(2024, 12, 30),
  );
  Book book3 = Book(
    title: 'title2',
    comment: 'comment2',
    publishDate: DateTime(2024, 7, 28),
  );

  List<Book> books = [];
  books.add(book1);
  books.add(book2);
  books.add(book3);

  books.sort(
      (a, b) => a.publishDate.compareTo(b.publishDate)); // 출간일이 빠른 순서대로 정렬
  print(books);

  books.sort(); // 출간일이 신상 순서대로 정렬
  print(books);
}
