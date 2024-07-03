import 'package:learn_dart_together/19_network/practice_5/data_source/book_api.dart';
import 'package:learn_dart_together/19_network/practice_5/repository/book_repository_impl.dart';

void main() async {
  BookRepositoryImpl bookDataSource = BookRepositoryImpl(BookApi());

  final books = await bookDataSource.getBooks();
  books.forEach(print);
}
