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
    required int extensionCount,
  }) = _Checkout;

  factory Checkout.fromJson(Map<String, Object?> json) =>
      _$CheckoutFromJson(json);

  factory Checkout.fromCsv(List<String> csv) =>
      Checkout(
          id: int.parse(csv[0]),
          userId: int.parse(csv[1]),
          bookId: int.parse(csv[2]),
          isReturned: bool.parse(csv[3]),
          checkoutDate: DateTime.parse(csv[4]),
          returnDate: DateTime.parse(csv[5]),
          extensionCount: int.parse(csv[6]),
      );
}
