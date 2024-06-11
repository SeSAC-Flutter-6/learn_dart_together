import 'package:learn_dart_together/04_240607_inheritance/book.dart';

class NonFiction extends Book {
  String subject;
  NonFiction(super.title, super.author, super.genre, this.subject);
}
