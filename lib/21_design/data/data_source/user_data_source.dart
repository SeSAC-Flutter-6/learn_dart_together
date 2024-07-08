import 'package:learn_dart_together/21_design/core/result.dart';

import '../../../21_design/data/model/user.dart';
import '../model/book.dart';

abstract interface class UserDataSource {
   Future<Result<Book, Error>> getUserCreate(User user);

   Future<Result<Book, Error>> getBookRead(int id);

   Future<Result<List<User>, Error>> fetchReadBooks();

   Future<Result<Book, Error>> getBookUpdate(Book book);

   Future<Result<Book, Error>> getBookDelete(Book book);
}