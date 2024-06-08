import 'Book.dart';

class Nonfiction extends Book {
  String subject;

  Nonfiction({
    required super.title,
    required super.author,
    required super.genre,
    required this.subject,
  });
}
