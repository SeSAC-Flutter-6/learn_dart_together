import 'package:learn_dart_together/05_inheritance/book/book.dart';

class Fiction extends Book {
  String subGenre;

  Fiction({
    required super.title,
    required super.author,
    required super.genre,
    required this.subGenre,
  });
}
