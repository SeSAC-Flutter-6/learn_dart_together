import 'dart:io';
import 'dart:math';

import 'package:learn_dart_together/18_design/core/result.dart';
import 'package:learn_dart_together/18_design/data/model/book.dart';
import 'package:learn_dart_together/18_design/data/repository_impl/book_repository_impl.dart';
import 'package:learn_dart_together/18_design/data/repository_impl/checkout_repository_impl.dart';

import '../../data/model/checkout.dart';
import '../../data/model/user.dart';
import '../../data/repository_impl/user_repository_impl.dart';
import '../../utils/constant.dart';

class CheckoutManage {
  final CheckoutRepositoryImpl _checkoutRepositoryImpl;
  final UserRepositoryImpl _userRepositoryImpl;
  final BookRepositoryImpl _bookRepositoryImpl;

  CheckoutManage(this._checkoutRepositoryImpl, this._userRepositoryImpl,
      this._bookRepositoryImpl);

  Future<void> manage() async {
    print('0. 뒤로\t\t1. 대출 목록\t\t2. 도서대출\t\t3. 도서반납\t\t 4. 대출연장');
    final input = stdin.readLineSync();
    while (true) {
      switch (input) {
        case '0':
          return;
        case '1':
          final checkouts = await _getCheckouts();
          if (checkouts.isEmpty) {
            print('대출 목록이 없습니다.');
          } else {
            print(checkouts);
          }
          return;
        case '2':
          await _createCheckout();
          return;
        case '3':
          await _returnBook();
          return;
        case '4':
          await _extension();
          return;
        case _:
          print('잘못된 입력');
          return;
      }
    }
  }

  Future<List<Checkout>> _getCheckouts() async {
    final getCheckoutsResult =
        await _checkoutRepositoryImpl.getSortedByReturnCheckouts();
    switch (getCheckoutsResult) {
      case Success(:final data):
        return data;
      case Error(:final e):
        print(e);
    }
    return [];
  }

  Future<void> _createCheckout() async {
    final checkouts = await _getCheckouts();
    int id = 1;
    for (Checkout checkout in checkouts) {
      id = max(checkout.id, id);
    }
    id += 1;

    print('대출 시작');
    final user = await _inputUser();
    final book = await _inputBook();

    DateTime now = DateTime.now();
    DateTime twoWeeksLater = now.add(Duration(days: 14));

    final newCheckout = Checkout(
      id: id,
      userId: user.id,
      bookId: book.id,
      isReturned: false,
      checkoutDate: now,
      returnDate: twoWeeksLater,
      extensionCount: BOOKEXTENSIONCOUNT,
    );

    final createCheckoutResult =
        await _checkoutRepositoryImpl.createCheckout(newCheckout, book);
    switch (createCheckoutResult) {
      case Success(:final data):
        print(data);
      case Error(:final e):
        print(e);
    }
  }

  Future<void> _returnBook() async {
    print('당신의 이름은?');
    final name = stdin.readLineSync() ?? '';
    final getUserResult = await _userRepositoryImpl.findByName(name);
    late User user;
    switch (getUserResult) {
      case Success(:final data):
        user = data;
      case Error(:final e):
        print(e);
    }

    List<Book> books = [];
    final booksResult = await _checkoutRepositoryImpl.getBooksCheckoutedByUser(user);
    switch (booksResult) {
      case Success(:final data):
        books = data;
        print(books);
      case Error(:final e):
        print(e);
    }

    print('반납 할 책의 이름을 입력해주세요.');
    final title = stdin.readLineSync() ?? '';

    final returnBookResult = await _checkoutRepositoryImpl.returnBook(user.id, title);
    switch (returnBookResult) {
      case Success(:final data):
        print('반납이 완료되었습니다.');
      case Error(:final e):
        print(e);
    }
  }

  Future<void> _extension() async {
    print('연장할 책의 이름을 입력해주세요.');
    final title = stdin.readLineSync() ?? '';
    final bookResult = await _bookRepositoryImpl.findByName(title);
    late Book book;
    switch (bookResult) {
      case Success(:final data):
        book = data;
      case Error(:final e):
        print(e);
    }

    final extensionResult =
        await _checkoutRepositoryImpl.extensionCheckout(book);
    switch (extensionResult) {
      case Success(:final data):
        print('${book.title} 책 연장되었습니다.');
      case Error(:final e):
        print(e);
    }
  }

  Future<User> _inputUser() async {
    final getUsersResult = await _userRepositoryImpl.getUsers();
    switch (getUsersResult) {
      case Success(:final data):
        print(data);
      case Error(:final e):
        print(e);
    }

    print('대출할 회원의 이름을 입력해주세요.');
    final name = stdin.readLineSync() ?? '';
    final userResult = await _userRepositoryImpl.findByName(name);
    switch (userResult) {
      case Success(:final data):
        return data;
      case Error(:final e):
        print(e);
    }

    throw Exception('대출 - getUsers fail');
  }

  Future<Book> _inputBook() async {
    final getBooksResult = await _bookRepositoryImpl.getBooksCheckoutAble();
    switch (getBooksResult) {
      case Success(:final data):
        print(data);
      case Error(:final e):
        print(e);
    }

    print('대출할 도서의 이름을 입력해주세요.');
    final title = stdin.readLineSync() ?? '';
    final bookResult = await _bookRepositoryImpl.findByName(title);
    switch (bookResult) {
      case Success(:final data):
        return data;
      case Error(:final e):
        print(e);
    }
    throw Exception('대출 - getBooks fail');
  }
}
