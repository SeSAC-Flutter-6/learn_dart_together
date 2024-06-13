import 'package:test/test.dart';
import 'package:learn_dart_together/07_instance_operator/book.dart';

void main() {
  group('Book class tests', () {
    test('제목과 출간일(2024-01-01)이 같으면 같은 책으로 판단한다', () {
      Book book1 = Book(
        title: 'Harry Potter',
        comment: 'Great book!',
      );
      Book book2 = Book(
        title: 'Harry Potter',
        comment: 'bad book!',
      );
      expect(book1 == book2, true);
      final bookSet1 = <Book>{};
      bookSet1.add(book1);
      bookSet1.add(book2);
      expect(bookSet1.length, 1);

      Book book3 = Book(
          title: 'Harry Potter',
          comment: 'Great book!',
          publishDate: DateTime(2024, 01, 01));

      Book book4 = Book(
          title: 'Harry Potter',
          comment: 'bad book!',
          publishDate: DateTime(2024, 01, 01));
      expect(book3 == book4, true);

      final bookSet2 = <Book>{};
      bookSet2.add(book3);
      bookSet2.add(book4);
      expect(bookSet2.length, 1);

      Book book5 = Book(
          title: 'Harry Potter',
          comment: 'Great book!',
          publishDate: DateTime(2024, 01, 01, 11, 30, 0));

      Book book6 = Book(
          title: 'Harry Potter',
          comment: 'bad book!',
          publishDate: DateTime(2024, 01, 01, 15, 21, 30));
      expect(book5 == book6, true);

      final bookSet3 = <Book>{};
      bookSet3.add(book5);
      bookSet3.add(book6);
      expect(bookSet3.length, 1);
    });

    test('Book 인스턴스를 담고 있는 컬렉션에 대해 sort() 를 수행하여 출간일이 신상 순서대로 정렬한다.', () {
      Book book1 = Book(
        title: 'Title1',
        comment: 'Great book!',
      );
      Book book2 = Book(
        title: 'Title2',
        comment: 'Great book!',
        publishDate: DateTime(2023, 03, 05),
      );
      Book book3 = Book(
        title: 'Title3',
        comment: 'Great book!',
        publishDate: DateTime(2024, 03, 05),
      );
      Book book4 = Book(
          title: 'Title4',
          comment: 'Great book!',
          publishDate: DateTime(2024, 01, 01));

      List<Book> books = [book1, book2, book3, book4];
      List<Book> expectedOrderBooks = [book1, book3, book4, book2];
      books.sort();

      for (int i = 0; i < books.length; i++) {
        expect(books[i], equals(expectedOrderBooks[i]));
      }
    });

    test('deep copy 를 위한 copyWith() 메서드를 제공한다', () {
      Book book1 = Book(
          title: 'Harry Potter',
          comment: 'Great book!',
          publishDate: DateTime(2024, 01, 01));
      Book copiedBook = book1.copyWith(title: "Copied Harry Potter");

      expect(copiedBook.title, 'Copied Harry Potter');
      expect(copiedBook.comment, book1.comment);
      expect(copiedBook.publishDate, book1.publishDate);
      expect(copiedBook == book1, false);
    });
  });
}
