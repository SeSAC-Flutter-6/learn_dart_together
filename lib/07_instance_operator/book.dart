class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          _isSamePublishDate(publishDate, other.publishDate);

  @override
  int get hashCode =>
      title.hashCode ^ publishDate.year ^ publishDate.month ^ publishDate.day;

  @override
  int compareTo(Book other) {
    return other.publishDate.compareTo(publishDate);
    // return this.publishDate.compareTo(other.publishDate) //오름차순 -> 오래된순으로 정렬됨
  }

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate, comment: $comment}';
  }

  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      publishDate: publishDate ?? this.publishDate,
      comment: comment ?? this.comment,
    );
  }

  bool _isSamePublishDate(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }
}
