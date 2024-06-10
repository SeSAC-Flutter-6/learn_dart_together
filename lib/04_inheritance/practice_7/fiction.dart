import 'book.dart';

class Fiction extends Book {
  String subgenre;

  Fiction({
    required super.title,
    required super.author,
    required super.genre,
    required super.price,
    required super.isbn,
    required this.subgenre,
  });

  @override
  void show() {
    print('제목: $title');
    print('저자: $author');
    print('장르: $genre');
    print('가격: $price');
    print('ISBN: $isbn');
    print('서브장르: $subgenre');
  }
}
