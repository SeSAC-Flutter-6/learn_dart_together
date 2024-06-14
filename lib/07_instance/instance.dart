import 'package:learn_dart_together/04_inheritance/slime/hero.dart';
import 'package:learn_dart_together/06_polymorphism/assingment.dart';

void main() {
  final heroes = <Hero>{};

  final h1 = Hero('name');
  final h2 = Hero('name');

  heroes.add(h1);
  heroes.remove(h2);

  print(heroes.length);

  Book a = Book(1, 2);
  Book b = Book(2, 4);
  Book c = Book(5, 3);

  print(a.hashCode);
  print(b.hashCode);
  print(a == b);

  final books = <Book>[];
  books.add(a);
  books.add(b);
  books.add(c);
  books.forEach((book) => print(book.b));

  books.sort();
  books.forEach((book) => print(book.b));
  books.sort((bookA, bookB) => bookA.b.compareTo(bookB.b));
  books.forEach((book) => print(book.b));
}

class Book implements Comparable<Book> {
  int a;
  int b;

  Book(this.a, this.b);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          a == other.a &&
          b == other.b;

  @override
  int get hashCode => a.hashCode ^ b.hashCode;

  @override
  int compareTo(Book other) {
    return b.compareTo(other.b);
  }
}
