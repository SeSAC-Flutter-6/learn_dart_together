import 'package:collection/collection.dart';
import 'package:learn_dart_together/18_design/core/result.dart';
import 'package:learn_dart_together/18_design/data/data_source/checkout_data_source.dart';
import 'package:learn_dart_together/18_design/data/model/checkout.dart';
import 'package:learn_dart_together/18_design/data/repository/checkout_repository.dart';

import '../data_source/book_data_source.dart';
import '../model/book.dart';
import '../model/user.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final CheckoutDataSource _checkoutDataSource;
  final BookDataSource _bookDataSource;

  CheckoutRepositoryImpl(this._checkoutDataSource, this._bookDataSource);

  @override
  Future<Result<Checkout>> createCheckout(Checkout checkout, Book book) async {
    try {
      await _bookDataSource.updateBook(
          book.id, book.copyWith(checkoutStatus: CheckoutStatus.checkouted));

      if (book.checkoutStatus != CheckoutStatus.readied) {
        return Result.error('이 책은 대출이 불가능 합니다.');
      }

      final result = await _checkoutDataSource.createCheckout(checkout);
      return Result.success(result);
    } catch (e) {
      return Result.error('createCheckout error');
    }
  }

  @override
  Future<Result<Checkout>> findByCheckoutId(int id) async {
    try {
      final getCheckoutResult = await _checkoutDataSource.getCheckouts();
      final checkout =
          getCheckoutResult.singleWhereOrNull((checkout) => checkout.id == id);

      if (checkout == null) throw Result.error('not find checkout');

      return Result.success(checkout);
    } catch (e) {
      return Result.error('find checkout error');
    }
  }

  @override
  Future<Result<Checkout?>> getCheckout(int id) async {
    try {
      final result = await _checkoutDataSource.getCheckout(id);
      return Result.success(result);
    } catch (e) {
      return Result.error('getCheckout error');
    }
  }

  @override
  Future<Result<List<Checkout>>> getSortedByReturnCheckouts() async {
    try {
      final checkouts = await _checkoutDataSource.getCheckouts();
      final result = checkouts.sortedByCompare(
          (element) => element.returnDate, (a, b) => a.compareTo(b));

      return Result.success(result);
    } catch (e) {
      return Result.error('getCheckouts error');
    }
  }

  @override
  Future<Result<Checkout>> extensionCheckout(Book book) async {
    try {
      final checkouts = await _checkoutDataSource.getCheckouts();
      final checkout =
          checkouts.singleWhereOrNull((checkout) => checkout.bookId == book.id);

      if (checkout == null) return Result.error('대출 현황에 없는 책입니다.');

      if (checkout.isReturned == true) return Result.error('이미 반납된 도서입니다.');

      DateTime now = DateTime.now();
      if (checkout.returnDate.isBefore(now)) {
        return Result.error('이미 반납 기한이 지난 책입니다.');
      }

      if (checkout.extensionCount == 0) return Result.error('연장 가능 횟수가 0입니다.');

      final newDate = checkout.returnDate.add(Duration(days: 7));

      final updateCheckout = await _checkoutDataSource.updateCheckout(
          checkout.id,
          checkout.copyWith(
            returnDate: newDate,
            extensionCount: (checkout.extensionCount - 1),
          ));

      return Result.success(updateCheckout);
    } catch (e) {
      return Result.error('updateCheckout error');
    }
  }

  @override
  Future<Result<Checkout>> returnBook(int userId, String title) async {
    try {
      final checkouts = await _checkoutDataSource.getCheckouts();
      final books = await _bookDataSource.getBooks();
      final returnAbleBooks = books
          .where((book) => book.checkoutStatus == CheckoutStatus.checkouted);
      final returnAbleBooksIds =
          returnAbleBooks.map((book) => book.id).toList();

      final targetCheckout = checkouts.singleWhereOrNull((checkout) {
        return (checkout.userId == userId &&
            checkout.isReturned == false &&
            returnAbleBooksIds.contains(checkout.bookId));
      });

      if (targetCheckout == null) return Result.error('찾는 대출 정보가 없습니다.');

      final book = await _bookDataSource.getBook(targetCheckout.bookId);

      if (book == null) return Result.error('책을 찾을 수 없습니다');

      await _bookDataSource.updateBook(targetCheckout.bookId,
          book.copyWith(checkoutStatus: CheckoutStatus.returned));

      final result = await _checkoutDataSource.updateCheckout(
          targetCheckout.id,
          targetCheckout.copyWith(
            isReturned: true,
          ));

      return Result.success(result);
    } catch (e) {
      return Result.error('updateCheckout error');
    }
  }

  @override
  Future<Result<List<Book>>> getBooksCheckoutedByUser(User user) async {
    try {
      final checkouts = await _checkoutDataSource.getCheckouts();
      final checkoutsByUser =
          checkouts.where((checkout) => checkout.userId == user.id);
      final bookIds =
          checkoutsByUser.map((checkout) => checkout.bookId).toList();

      final List<Book> books = [];
      for (int bookId in bookIds) {
        final getBook = await _bookDataSource.getBook(bookId);
        if (getBook == null) continue;
        books.add(getBook);
      }

      return Result.success(books);
    } catch (e) {
      return Result.error('getCheckouts error');
    }
  }
}
