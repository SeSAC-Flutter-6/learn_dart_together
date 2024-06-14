
import 'package:learn_dart_together/07_Instance_control/book.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Book Test', () {
    test('copyWith으로 복사된 객체는 hashCode가 다르다', () {
      final Book book1 = Book(title: '해리포터', comment: '재밌음');
      final Book book2 = book1.copyWith();

      expect(book1.hashCode == book2.hashCode, false);
    });
    test('title, publishDate(year, month, day)로 동등성 비교', () {
      // publishDate의 hour, minute을 다르게 생성
      final Book book1 = Book(title: '해리포터', comment: '재밌음', publishDate: DateTime(2024,6,13,16,4));
      final Book book2 = Book(title: '해리포터', comment: '재미없음', publishDate: DateTime(2024,6,13,8,1));
      expect(book1 == book2, true);

      // publishDate의 day를 다르게 생성
      final Book book3 = Book(title: '해리포터', comment: '재밌음', publishDate: DateTime(2024,6,13,16,4));
      final Book book4 = Book(title: '해리포터', comment: '재미없음', publishDate: DateTime(2024,6,12,8,1));
      expect(book3 == book4, false);
    });
    test('List<Book>은 publishDate의 최신순으로 정렬된다.', () {
    final Book book1 = Book(title: '해리포터', comment: '재밌음', publishDate: DateTime(2024,6,13,16,4));
    final Book book2 = Book(title: '해리포터', comment: '재미없음', publishDate: DateTime(2024,6,12,8,1));
    final Book book3 = Book(title: '해리포터', comment: '재밌음', publishDate: DateTime(2024,6,11,16,4));
    final Book book4 = Book(title: '해리포터', comment: '재미없음', publishDate: DateTime(2024,6,8,8,1));

    List<Book> books = [book2, book4, book1, book3];
    List<Book> sortedBooks = [book1, book2, book3, book4];
    books.sort();

      for (int i = 0; i < books.length; i++) {
        expect(books[i].hashCode == sortedBooks[i].hashCode, true);
      }
    });
  });
}