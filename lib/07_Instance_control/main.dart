import 'Book.dart';

void main() {
  Book book1 = Book(title: '해리포터', comment: '코멘트');
  Book book2 = Book(title: '해리포터', comment: '코멘트1');
  Book book3 = Book(title: '해리포터', comment: '코멘트2', publishDate: DateTime(2024, 6, 12));
  Book book3Copied = book3.copyWith();

  List<Book> books = [book3, book1, book2];
  books.sort();

  // Book의 publishDate를 바탕으로 신상순으로 정렬.
  List<Book> booksSortedByLatest = books.reversed.toList();

  // 출력
  booksSortedByLatest.forEach((item) {
    print("제목: ${item.title}, 출간일: ${item.publishDate}");
  });

  // book3와 복사된 book3Copied hashcode 비교
  print('book3와 book3 복사본의 객체 동등성: ${book3.hashCode == book3Copied.hashCode}');
}