import 'book.dart';

class NonFiction extends Book {
  String subject;

  NonFiction({
    required super.title,
    required super.author,
    required super.genre,
    required super.price,
    required super.isbn,
    required this.subject,
  });

  @override
  void show() {
    print('제목: $title');
    print('저자: $author');
    print('장르: $genre');
    print('가격: $price');
    print('ISBN: $isbn');
    print('주제: $subject');
  }
}
