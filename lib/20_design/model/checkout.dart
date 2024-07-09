import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout.freezed.dart';
part 'checkout.g.dart';

enum BookStatus {
  borrowed,
  returned,
  overdue,
}

@freezed
class Checkout with _$Checkout {
  const factory Checkout({
    required int id,
    required int memberId,
    required String memberName,
    required int bookId,
    required String bookTitle,
    required DateTime borrowDate,
    required DateTime returnDate,
    required BookStatus bookStatus,
    required bool isExtendable,
  }) = _Checkout;

  factory Checkout.fromJson(Map<String, Object?> json) =>
      _$CheckoutFromJson(json);
}
