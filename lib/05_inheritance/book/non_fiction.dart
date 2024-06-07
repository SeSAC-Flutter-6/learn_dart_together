import 'package:learn_dart_together/05_inheritance/book/book.dart';

class NonFiction extends Book {
  String subject;

  NonFiction({
    required super.title,
    required super.author,
    required super.genre,
    required this.subject,
  });
}
