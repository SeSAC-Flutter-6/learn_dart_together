void main() {
  final book1 =
      Book(title: "가가", publishDate: DateTime(1998, 3, 15), comment: "Hi");

  final book2 =
      Book(title: "나나", publishDate: DateTime(1998, 12, 16), comment: "Hi");

  final book3 =
      Book(title: "다다", publishDate: DateTime(2000, 11, 12), comment: "Hi");

  final book4 =
      Book(title: "다다", publishDate: DateTime(2000, 11, 12), comment: "Hiii");

  print(book3 == book4); // true

  List<Book> booklist = [book3, book1, book2];

  booklist.sort();
  print(booklist[0].title);

  final book5 = book4.copyWith();
  print(book4.hashCode);
  print(book5.hashCode);

  print(DateTime(2, 111, 15));
}

class Book implements Comparable<Book> {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  // 연습문제 1)
  @override
  bool operator ==(covariant Book other) {
    return (identical(this, other)) ||
        other.title == title &&
            other.publishDate.toString().substring(0, 10) ==
                publishDate.toString().substring(0, 10);
  }

  // 연습문제 2)
  @override
  int compareTo(Book other) {
    return -publishDate.compareTo(other.publishDate);
  }

  // 연습문제 3)
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
  int get hashCode =>
      title.hashCode ^ publishDate.year ^ publishDate.month ^ publishDate.day;
}
