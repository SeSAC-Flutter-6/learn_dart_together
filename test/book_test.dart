import 'dart:math';

import 'package:learn_dart_together/07_instance/assingment.dart';
import 'package:test/test.dart';

void main() {
  test('제목과 출간일(year, month, day)이 같으면 같은 책이다', () {
    Book myBook =
        Book(title: '나작소', comment: '내 책', publishDate: DateTime(2024, 6, 12));
    Book bestSeller = Book(
        title: '나작소', comment: '베스트셀러', publishDate: DateTime(2024, 6, 12));

    Book notMatchTitle = Book(
        title: '나큰소', comment: '베스트셀러', publishDate: DateTime(2024, 6, 12));

    Book notMatchDate = Book(
        title: '나큰소', comment: '베스트셀러', publishDate: DateTime(2024, 6, 13));

    Book nowBook = Book(title: '나작소', comment: '내 책');
    Book nowBook2 = Book(title: '나작소', comment: '니 책');

    expect(myBook, equals(bestSeller));
    expect(myBook, isNot(notMatchTitle));
    expect(myBook, isNot(notMatchDate));
    expect(nowBook, equals(nowBook2));
  });

  test('Books에서 sort를 하면 출간일이 신상인 순서대로 정렬된다.', () {
    Book a = Book(title: 'a', comment: '', publishDate: DateTime(2024, 6, 12));
    Book b = Book(title: 'b', comment: '', publishDate: DateTime(2023, 6, 12));
    Book c = Book(title: 'c', comment: '', publishDate: DateTime(2025, 6, 12));
    Book d = Book(title: 'd', comment: '', publishDate: DateTime(2026, 6, 12));
    final books = [a, b, c, d];
    books.sort();

    expect(books, [d, c, a, b]);

    final setBooks = {a, b, c, d};
    final setBooks2 = {b, c, d, a};
    expect(setBooks2, setBooks);
  });

  test('deep copy인 copyWith 메서드를 제공한다.', () {
    Book myBook =
        Book(title: '나작소', comment: '내 책', publishDate: DateTime(2024, 6, 12));
    Book newBook = myBook.copyWith();
    expect(myBook, newBook);
    expect(myBook.toString(), newBook.toString());
    expect(myBook.hashCode, newBook.hashCode);
  });
}
