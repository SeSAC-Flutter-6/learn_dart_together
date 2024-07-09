import 'package:learn_dart_together/21_design_pattern/model/book.dart';
import 'package:learn_dart_together/21_design_pattern/model/check_out.dart';

abstract interface class LibraryRepository {
  Future<List<Book>> getBooks();
  Future<Book> getBook(int id);
  Future<Book> createBook(Book book);
  Future<Book> updateBook(Book book);
  Future<Book> deleteBook(int id);

  Future<List<CheckOut>> getCheckOuts();
  Future<CheckOut> getCheckOut(int id);
  Future<CheckOut> createCheckOut(CheckOut checkOut);
  Future<CheckOut> updateCheckOut(CheckOut checkOut);
  Future<CheckOut> deleteCheckOut(int id);

  // duedate 임박한 순으로 정렬 후 반환
  Future<List<CheckOut>> getDueCheckOuts();
  // Future<CheckOut> returnBook(int id);
  Future<CheckOut> extendDueDate(int id);
}
