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
  int compareTo(Book other) =>
      other.publishDate.compareTo(publishDate); //최신순으로 정렬하기 위함

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate.year == other.publishDate.year &&
          publishDate.month == other.publishDate.month &&
          publishDate.day == other.publishDate.day;

  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) =>
      Book(
          title: title ?? this.title,
          publishDate: publishDate ?? this.publishDate,
          comment: comment ?? this.comment);
}

void main() {
  List<Book> books = [
    Book(title: 'A', publishDate: DateTime(2024, 1, 1), comment: 'a'),
    Book(title: 'A', publishDate: DateTime(2024, 1, 1), comment: 'c'),
    //0번째 요소와 comment만 다르게 설정
    Book(title: 'C', publishDate: DateTime(2024, 1, 2), comment: 'c'),
    Book(title: 'B', publishDate: DateTime(2024, 2, 1), comment: 'b')
  ];
  //Book 클래스에서 오버라이드된 operator == 메서드가 없을 시 false, 있을 시 true
  print(books[0] == books[1]);

  // books.sort(); //클래스 내에서 override된 compareTo 활용 시
  books.sort((a, b) => b.publishDate.compareTo(a.publishDate));

  books.forEach((book) {
    print(
        'Title: ${book.title}, Publish Date: ${book.publishDate}, Comment: ${book.comment}');
  });

  Book book = books[0];
  Book bookCopy = book.copyWith(comment: 'copied');

  print(
      "\nOriginal Book A: ${book.title}, ${book.publishDate}, ${book.comment}");
  print(
      "Copied Book: ${bookCopy.title}, ${bookCopy.publishDate}, ${bookCopy.comment}");

  print(book == bookCopy);
}
