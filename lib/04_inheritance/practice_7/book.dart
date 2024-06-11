class Book {
  String title;
  String author;
  String genre;
  String price;
  String isbn;

  Book({
    required this.title,
    required this.author,
    required this.genre,
    required this.price,
    required this.isbn,
  });

  void show() {
    print('제목: $title');
    print('저자: $author');
    print('장르: $genre');
    print('가격: $price');
    print('ISBN: $isbn');
  }
}
