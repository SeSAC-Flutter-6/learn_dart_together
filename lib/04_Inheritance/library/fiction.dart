
import 'package:learn_dart_together/04_Inheritance/library/book.dart';

class Fiction extends Book {
  Set<Genre> genres = {};

  Fiction({
    required super.title,
    required super.authors,
    required super.genre
  });
}