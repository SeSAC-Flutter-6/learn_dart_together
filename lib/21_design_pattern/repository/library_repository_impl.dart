import 'package:collection/collection.dart';
import 'package:learn_dart_together/21_design_pattern/data_source/book_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/data_source/check_out_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/data_source/memory_data_source/memory_book_api.dart';
import 'package:learn_dart_together/21_design_pattern/data_source/memory_data_source/memory_check_out_api.dart';
import 'package:learn_dart_together/21_design_pattern/model/book.dart';
import 'package:learn_dart_together/21_design_pattern/model/check_out.dart';
import 'package:learn_dart_together/21_design_pattern/repository/library_repository.dart';

class LibraryRepositoryImpl implements LibraryRepository {
  final BookDataSource _bookDataSource;
  final CheckOutDataSource _checkOutDataSource;

  LibraryRepositoryImpl([
    BookDataSource? bookDataSource,
    CheckOutDataSource? checkOutDataSource,
  ])  : _bookDataSource = bookDataSource ?? MemoryBookApi(),
        _checkOutDataSource = checkOutDataSource ?? MemoryCheckOutApi();

  @override
  Future<Book> createBook(Book book) {
    return _bookDataSource.createBook(book);
  }

  @override
  Future<Book> deleteBook(int id) {
    return _bookDataSource.deleteBook(id);
  }

  @override
  Future<List<Book>> getBooks() {
    return _bookDataSource.getBooks();
  }

  @override
  Future<Book> getBook(int id) {
    return _bookDataSource.getBook(id);
  }

  @override
  Future<Book> updateBook(Book book) {
    return _bookDataSource.updateBook(book);
  }

  @override
  Future<CheckOut> createCheckOut(CheckOut checkOut) {
    return _checkOutDataSource.createCheckOut(checkOut);
  }

  @override
  Future<CheckOut> deleteCheckOut(int id) {
    return _checkOutDataSource.deleteCheckOut(id);
  }

  @override
  Future<List<CheckOut>> getCheckOuts() {
    return _checkOutDataSource.getCheckOuts();
  }

  @override
  Future<CheckOut> getCheckOut(int id) {
    return _checkOutDataSource.getCheckOut(id);
  }

  @override
  Future<CheckOut> updateCheckOut(CheckOut checkOut) {
    return _checkOutDataSource.updateCheckOut(checkOut);
  }

  @override
  Future<List<CheckOut>> getDueCheckOuts() async {
    var checkOuts = await _checkOutDataSource.getCheckOuts();
    var sortedCheckOuts = checkOuts.sorted((a, b) {
      if (a.dueDate == null && b.dueDate == null) return 0;
      if (a.dueDate == null) return 1;
      if (b.dueDate == null) return -1;
      return a.dueDate!.compareTo(b.dueDate!);
    });
    return sortedCheckOuts;
  }

  @override
  Future<CheckOut> extendDueDate(int id) async {
    final checkOut = await _checkOutDataSource.getCheckOut(id);

    if (checkOut.extensionCount != null && checkOut.extensionCount! >= 1) {
      throw Exception('Extension limit reached');
    }

    return _checkOutDataSource.updateCheckOut(CheckOut(
      id: checkOut.id,
      dueDate: checkOut.dueDate?.add(Duration(days: 7)),
      extensionCount: checkOut.extensionCount! + 1,
    ));
  }

  // @override
  // Future<CheckOut> returnBook(int checkOutId) {
  //   return _checkOutDataSource.returnBook(checkOutId);
  // }
}
