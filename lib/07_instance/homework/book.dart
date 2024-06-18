/*
다음 동작을 할 수 있도록 Book 클래스를 수정하시오.

제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다
Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다.
deep copy 를 위한 copyWith() 메서드를 제공한다
*/

class Book implements Comparable<Book> {
  String title;
  String comment;
  DateTime publishDate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          //publishDate.toString().substring(0,10) == other.publishDate.toString().substring(0,10);
          publishDate.year == other.publishDate.year &&
          publishDate.month == other.publishDate.month &&
          publishDate.day == other.publishDate.day;

  @override
  int get hashCode =>
      title.hashCode ^
      publishDate.year.hashCode ^
      publishDate.month.hashCode ^
      publishDate.day.hashCode;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  @override
  String toString() {
    return 'Book{title: $title, comment: $comment, publishDate: $publishDate}';
  }

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

  final books = [
    Book(
      title: '플러터마스터되기',
      comment: '기본서',
      publishDate: DateTime(2024, 06, 13),
    ),
    Book(
      title: '플러터마스터되기',
      comment: '개정판1',
      publishDate: DateTime(2025, 06, 14),
    ),
    Book(
      title: '플러터마스터되기',
      comment: '개정판2',
      publishDate: DateTime(2025, 12, 25),
    ),
  ];

  Book books2 = Book(title: '자바의정석111', comment: '222');

  Book books1 = Book(title: '자바의정석', comment: '11');

  Book deepCopy = books1.copyWith(title: books1.title,comment: books1.comment);
  deepCopy.title = '플러터의 정석';
  print(books1.title); // 자바의 정석

  Book shallowCopy = books1;
  shallowCopy.title = '플러터의 정석';
  print(shallowCopy.title); // 플러터의 정석

  Set bookSet = {books1, books2};
  //print(bookSet.length);

  final bookList = [];
  bookList.add(books1);
  bookList.add(books2);
  //print(bookList.length);

  books.sort((a, b) => a.publishDate.compareTo(b.publishDate));
 // print(books);
}
