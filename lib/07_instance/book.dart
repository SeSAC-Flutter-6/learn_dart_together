//다음 동작을 할 수 있도록 Book 클래스를 수정하시오.
//
//제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다
//Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다.
//deep copy 를 위한 copyWith() 메서드를 제공한다

class Book {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Book &&
            runtimeType == other.runtimeType &&
            title == other.title &&
            comment == other.comment &&
            publishDate.year == other.publishDate.year &&
            publishDate.month == other.publishDate.month &&
            publishDate.day == other.publishDate.day;
  }

  @override
  int get hashCode =>
      title.hashCode ^
      publishDate.year.hashCode ^
      publishDate.month.hashCode ^
      publishDate.day.hashCode;

  Book copyWith({
    String? title,
    DateTime? publishDate,
    String? comment,
  }) {
    return Book(
      title: title ?? this.title,
      comment: comment ?? this.comment,
    );
  }

  @override
  int compareTo(Book other) {
    return publishDate.compareTo(other.publishDate);
  }

  @override
  String toString() {
    return 'Book{title : $title, publishDate: ${publishDate.year}-${publishDate.month}-${publishDate.day}';
  }
}

void main() {
  Book book = Book(
      title: '아틀란티스', comment: 'fiction', publishDate: DateTime(2019, 12, 01));
  Book book1 = Book(
      title: '아틀란티스2', comment: 'fiction', publishDate: DateTime(2020, 12, 01));
  Book book2 = Book(
      title: '아틀란티스3', comment: 'fiction', publishDate: DateTime(2021, 12, 01));
  Book book3 = Book(
      title: '아틀란티스4', comment: 'fiction', publishDate: DateTime(2022, 12, 01));


  List<Book> books = [book, book1, book2, book3];
  books.sort((a, b) => -a.publishDate.compareTo(b.publishDate));
  print(books);
}
