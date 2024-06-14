import 'package:test/test.dart';
import 'package:learn_dart_together/07_240613_instance/book.dart';

void main() {
  test('제목과 출간일이 같으면 같은 책이다', () {
    Book book =
        Book(title: '음악', comment: '진라면용', publishDate: DateTime(2017, 9, 7));
    Book book2 =
        Book(title: '음악', comment: '신라면용', publishDate: DateTime(2017, 9, 7));

    expect(book == book2, equals(true));
  });

  test('sort를 통해서, 출간 년월일을 보고 최신순으로 정렬', () {
    DateTime today = DateTime.now();
    DateTime yesterday = today.subtract(Duration(days: 1));
    DateTime twoDaysAgo = today.subtract(Duration(days: 2));
    DateTime threeDaysAgo = today.subtract(Duration(days: 3));

    Book book3 = Book(title: '플러터', comment: '1일 전', publishDate: yesterday);
    Book book4 = Book(title: '플러터', comment: '2일 전', publishDate: twoDaysAgo);
    Book book5 = Book(title: '플러터', comment: '3일 전', publishDate: threeDaysAgo);
    List<Book> books = [book3, book4, book5];
    books.sort();

    expect(books, equals([book5, book4, book3]));
  });

  test('copyWith 메서드 테스트', () {
    Book book6 = Book(title: '플러터1', comment: '플러터1');
    Book book7 = book6.copyWith();

    expect(book6 == book7, true);
  });
}
