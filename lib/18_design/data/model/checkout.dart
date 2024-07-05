import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout.freezed.dart';

part 'checkout.g.dart';

@freezed
class Checkout with _$Checkout {
  const factory Checkout({
    required int id,
    required int userId,
    required int bookId,
    required bool isReturned,
    required DateTime checkoutDate,
    required DateTime returnDate,
  }) = _Checkout;

  factory Checkout.fromJson(Map<String, Object?> json) =>
      _$CheckoutFromJson(json);
}
