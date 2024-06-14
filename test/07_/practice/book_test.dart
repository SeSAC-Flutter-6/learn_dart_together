import 'package:test/test.dart';
import 'package:learn_dart_together/07_/practice/book.dart';

void main() {
  group('book 클래스 테스트', () {
    late Book book0;
    late Book book1;
    late Book book2;
    late Book book3;
    late Book book4;
    late Book book5;

    setUp(() {
      book0 = Book(
          title: '책1',
          comment: '책999의 코멘트',
          publishDate: DateTime(2021, 1, 40));
      book1 = Book(
          title: '책1', comment: '책1의 코멘트', publishDate: DateTime(2021, 1, 40));
      book2 = Book(
          title: '책2', comment: '책2의 코멘트', publishDate: DateTime(2021, 1, 3));
      book3 = Book(
          title: '책3', comment: '책2의 코멘트', publishDate: DateTime(2021, 1, 5));
      book4 = Book(
          title: '책4', comment: '책2의 코멘트', publishDate: DateTime(2021, 1, 8));
      book5 = Book(
          title: '책5', comment: '책2의 코멘트', publishDate: DateTime(2021, 1, 20));
    });
    test('제목과 출간일(ex.2024-01-01)이 같으면 같은 책으로 판단', () {
      expect(book0 == book1, true);
    });

    test('Book 인스턴스를 담고 있는 컬렉션에 대해 sort()를 수행하여 출간일이 신상 순서대로 정렬한다.', () {
      //book1 과 book2를 컬렉션에 담아라
      List<Book> books = [];

      books.add(book1);
      books.add(book2);
      books.add(book3);
      books.add(book4);
      books.add(book5);

      books.sort();

      expect(books[0].title, '책1');
      expect(books[1].title, '책5');
      expect(books[2].title, '책4');
      expect(books[3].title, '책3');
      expect(books[4].title, '책2');
    });

    test('deep copy 를 위한 copyWith() 메서드를 제공한다', () {
      Book copiedBook = book1.copyWith();
      expect(copiedBook.title, book1.title);
      expect(copiedBook.comment, book1.comment);
      expect(copiedBook.publishDate, book1.publishDate);
    });
  });
}
