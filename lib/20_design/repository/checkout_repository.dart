import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/model/checkout.dart';

abstract interface class CheckoutRepository {
  Future<Result<List<Checkout>, String>> getCheckout({int? memberId});

  Future<Result<Checkout, String>> registerCheckout({
    required int memberId,
    required int bookId,
  });

  Future<Result<Checkout, String>> returnCheckout({
    required int memberId,
    required int bookId,
  });

  Future<Result<Checkout, String>> extendCheckout({
    required int memberId,
    required int bookId,
  });

  Future<void> restoreCheckouts();
}
