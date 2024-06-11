import 'package:learn_dart_together/04_inheritance/book/book.dart';

class Fiction extends Book {
  String subGenre;

  Fiction(super.title, super.author, super.genre, this.subGenre);
}
