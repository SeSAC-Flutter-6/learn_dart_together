class Book implements Comparable {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

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
  int get hashCode =>
      title.hashCode ^ publishDate.year ^ publishDate.month ^ publishDate.day;

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate, comment: $comment}';
  }

  @override
  int compareTo(other) {
    if (publishDate.year > other.publishDate.year) {
      return 1;
    } else if (publishDate.year < other.publishDate.year) {
      return -1;
    } else {
      if (publishDate.month > other.publishDate.month) {
        return 1;
      } else if (publishDate.month < other.publishDate.month) {
        return -1;
      } else {
        if (publishDate.day > other.publishDate.day) {
          return 1;
        } else if (publishDate.day < other.publishDate.day) {
          return -1;
        } else {
          return 0;
        }
      }
    }
  }
}
