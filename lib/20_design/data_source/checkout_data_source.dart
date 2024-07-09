import 'package:learn_dart_together/20_design/model/checkout.dart';

abstract interface class CheckoutDataSource {
  Future<void> fetchCheckouts();

  Future<List<Checkout>> getCheckout({int? memberId, int? bookId});

  Future<void> addCheckout(Checkout checkout);

  Future<Checkout?> updateCheckout({
    required int memberId,
    required int bookId,
    DateTime? returnDate,
    BookStatus? bookStatus,
    bool? isExtendable,
  });
}
