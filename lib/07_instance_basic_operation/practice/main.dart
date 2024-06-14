import 'book.dart';

void main() {
  Book book1 =
      Book(title: '책1', comment: '책1의 코멘트', publishDate: DateTime(2021, 1, 40));
  Book book2 =
      Book(title: '책2', comment: '책2의 코멘트', publishDate: DateTime(2021, 1, 3));
  Book book3 =
      Book(title: '책3', comment: '책2의 코멘트', publishDate: DateTime(2021, 1, 2));
  Book book4 =
      Book(title: '책4', comment: '책2의 코멘트', publishDate: DateTime(2021, 1, 8));
  Book book5 =
      Book(title: '책5', comment: '책2의 코멘트', publishDate: DateTime(2021, 1, 20));

  //book1 과 book2를 컬렉션에 담아라
  List<Book> books = [];

  books.add(book1);
  books.add(book2);
  books.add(book3);
  books.add(book4);
  books.add(book5);

  book1 = book2.copyWith();
  print(book1.title);
  print(book2.title);

  books.sort();
  for (var book in books) {
    print(book.title);
  }
}
