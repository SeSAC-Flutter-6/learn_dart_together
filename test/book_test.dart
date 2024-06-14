import 'package:learn_dart_together/07_instance/homework/book.dart';
import 'package:test/test.dart';

void main() {
  group('같은 책인지 테스트', () {
    test('제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다', () {
      Book book1 = Book(
        title: '다트의정석',
        comment: '한국어 버전',
        publishDate: DateTime(2024, 06, 13),
      );
      Book book2 = Book(
        title: '다트의정석',
        comment: '영어 버전',
        publishDate: DateTime(2024, 06, 13),
      );

      final books = [];
      books.add(book1);
      books.remove(book2);

      expect((book1 == book2), equals(true));
      expect(books.length, equals(0));
    });

    test('제목이 다르면 다른 책으로 판단한다', () {
      Book book1 = Book(
        title: '다트의정석',
        comment: '한국어 버전',
        publishDate: DateTime(2024, 06, 14),
      );
      Book book2 = Book(
        title: '다트의정석 개정판',
        comment: '영어 버전',
        publishDate: DateTime(2024, 06, 14),
      );
      expect((book1 == book2), equals(false));
    });

    test('출간일(2024-01-01)이 다르면 다른 책으로 판단한다', () {
      Book book1 = Book(
        title: '다트의정석',
        comment: '한국어 버전',
        publishDate: DateTime(2024, 06, 13),
      );
      Book book2 = Book(
        title: '다트의정석',
        comment: '영어 버전',
        publishDate: DateTime(2024, 06, 14),
      );
      expect((book1 == book2), equals(false));
    });
  });

  test('출간일을 지정하지 않으면 오늘 날짜가 되어야 한다.', () {
    Book book = Book(
      title: '다트의정석',
      comment: '한국어 버전',
    );
    expect((book.publishDate.year), equals(DateTime.now().year));
    expect((book.publishDate.month), equals(DateTime.now().month));
    expect((book.publishDate.day), equals(DateTime.now().day));
  });
}
