import 'package:learn_dart_together/04_Inheritance/library/book.dart';

class Nonfiction extends Book {
  String subject;

  Nonfiction({
    required super.title,
    required super.authors,
    required super.genre,
    required this.subject
  });
}