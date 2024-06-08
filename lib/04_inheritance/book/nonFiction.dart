import 'package:learn_dart_together/04_inheritance/book/book.dart';

class Nonfiction extends Book {
  String subject;

  Nonfiction(super.title, super.author, super.genre, this.subject);
}
