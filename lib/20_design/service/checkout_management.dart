import 'package:collection/collection.dart';
import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/model/checkout.dart';
import 'package:learn_dart_together/20_design/repository/checkout_repository.dart';
import 'package:learn_dart_together/20_design/service/my_library.dart';
import 'package:learn_dart_together/20_design/utils/function.dart';

class CheckoutManagement {
  final MyLibrary _myLibrary;
  final CheckoutRepository _checkoutRepository;

  CheckoutManagement(
    this._myLibrary,
    this._checkoutRepository,
  );

  Future<void> manageCheckout() async {
    while (true) {
      final input = validateInput(
          '0. 뒤로   1. 대여/반납조회   2. 대여/반납검색   3. 대여   4. 반납   5. 연장');
      if (input == null) continue;

      switch (input) {
        case '0':
          _myLibrary.displayMain();
          return;
        case '1':
          await getCheckouts();
          break;
        case '2':
          await searchCheckout();
          break;
        case '3':
          await registerCheckout();
          break;
        case '4':
          await returnCheckout();
          break;
        case '5':
          await extendCheckout();
          break;
        default:
          print('잘못된 입력: 숫자(0~5)를 입력하세요.');
          break;
      }
    }
  }

  Future<void> getCheckouts() async {
    final checkouts = await _checkoutRepository.getCheckout();
    switch (checkouts) {
      case Success():
        checkouts.data
            .sorted((a, b) => a.returnDate.compareTo(b.returnDate))
            .forEach((checkout) => print(checkout.toInfo()));
        break;
      case Error():
        print(checkouts.error);
        break;
    }
  }

  Future<void> searchCheckout() async {
    final memberId = validateId('회원 ID를 입력하세요.');
    if (memberId == null) return;

    final checkouts = await _checkoutRepository.getCheckout(memberId: memberId);
    switch (checkouts) {
      case Success():
        checkouts.data.forEach((checkout) => print(checkout.toInfo()));
      case Error():
        print(checkouts.error);
    }
  }

  Future<void> registerCheckout() async {
    final memberId = validateId('회원 ID를 입력하세요.');
    if (memberId == null) return;

    final bookId = validateId('도서 ID를 입력하세요.');
    if (bookId == null) return;

    final checkout = await _checkoutRepository.registerCheckout(
      memberId: memberId,
      bookId: bookId,
    );
    _printResult(checkout, '도서대여를 완료했습니다.');
  }

  Future<void> returnCheckout() async {
    final memberId = validateId('회원 ID를 입력하세요.');
    if (memberId == null) return;

    final bookId = validateId('도서 ID를 입력하세요.');
    if (bookId == null) return;

    final checkout = await _checkoutRepository.returnCheckout(
      memberId: memberId,
      bookId: bookId,
    );
    _printResult(checkout, '도서반납을 완료했습니다.');
  }

  Future<void> extendCheckout() async {
    final memberId = validateId('회원 ID를 입력하세요.');
    if (memberId == null) return;

    final bookId = validateId('도서 ID를 입력하세요.');
    if (bookId == null) return;

    final member = await _checkoutRepository.extendCheckout(
      memberId: memberId,
      bookId: bookId,
    );
    _printResult(member, '대여기간을 연장했습니다.');
  }

  void _printResult(Result<Checkout, String> result, String message) {
    switch (result) {
      case Success():
        print('${result.data.toInfo()} $message');
        break;
      case Error():
        print(result.error);
        break;
    }
  }
}
