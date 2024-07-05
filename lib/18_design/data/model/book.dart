import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required int id,
    required String title,
    required int extensionCount,
    required CheckoutStatus checkoutStatus,
  }) = _Book;

  factory Book.fromJson(Map<String, Object?> json) => _$BookFromJson(json);
}

enum CheckoutStatus {
  readied,
  checkouted,
  returned,
}
