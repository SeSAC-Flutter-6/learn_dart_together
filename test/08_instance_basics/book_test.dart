import 'package:learn_dart_together/08_instance_basics/book.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('제목과 출간일이 같으면 같은 책이다.', () {
    Book book1 = Book(
        title: '가나다',
        comment: 'good',
        publishDate: DateTime(2024, 1, 1, 12, 24));
    Book book2 = Book(
        title: '가나다',
        comment: 'good',
        publishDate: DateTime(2024, 1, 1, 10, 30));
    expect(book1 == book2, true);
  });
  test('copyWith()를 사용하여 속성값이 같은 객체를 만든다.', () {
    Book book = Book(title: '가나다', comment: 'good');
    Book book1 = book.copyWith();
    expect(book == book1, true);
  });
  test('sort()를 사용하면 출간일이 신상 순으로 정렬된다.', () {
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
    List<Book> books = [book1, book2, book3];
    books.sort();
    expect(books, [book2, book3, book1]);
  });
}
