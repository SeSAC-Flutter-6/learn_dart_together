import 'package:learn_dart_together/07_instance/book.dart';
import 'package:test/test.dart';

void main() {
  group('Book test', () {
    final book1 =
        Book(title: "A", publishDate: DateTime(2000, 1, 22), comment: "1");
    final book2 =
        Book(title: "A", publishDate: DateTime(2000, 1, 22), comment: "2");
    final book3 =
        Book(title: "A", publishDate: DateTime(2000, 1, 23), comment: "3");
    final book4 =
        Book(title: "B", publishDate: DateTime(2000, 1, 22), comment: "4");
    final book5 =
        Book(title: "C", publishDate: DateTime(2000, 1, 21), comment: "5");
    final book6 =
        Book(title: "D", publishDate: DateTime(2000, 1, 20), comment: "6");

    test('제목과 출간일이 같으면 같은 책으로 판단하여 true 반환', () {
      expect((book1 == book2), true);
      expect((book1 == book3), false);
      expect((book1 == book3), false);
    });

    test('Book 컬렉션을 sort() 하면 출간일 최신순으로 정렬', () {
      List<Book> books = [book4, book5, book3, book6];

      books.sort();

      expect(books, [book3, book4, book5, book6]);
    });

    test('Book 객체를 copyWith() 하면 모든 속성값이 같은 객체 생성', () {
      final copiedBook = book6.copyWith();

      expect((copiedBook.title, copiedBook.publishDate, copiedBook.comment),
          (book6.title, book6.publishDate, book6.comment));
    });
  });
}
