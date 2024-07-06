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
    required DateTime publishedData,
  }) = _Book;

  factory Book.fromJson(Map<String, Object?> json) => _$BookFromJson(json);

  factory Book.fromCsv(List<String> csv) => Book(
        id: int.parse(csv[0]),
        title: csv[1],
        extensionCount: int.parse(csv[2]),
        checkoutStatus: CheckoutStatusExtension.fromString(csv[3]),
        publishedData: DateTime.parse(csv[4]),
      );
}

enum CheckoutStatus {
  readied,
  checkouted,
  returned,
}

extension CheckoutStatusExtension on CheckoutStatus {
  static CheckoutStatus fromString(String statusString) {
    return CheckoutStatus.values.firstWhere(
      (status) => status.toString().split('.').last == statusString,
      orElse: () =>
          throw ArgumentError('Invalid checkout status: $statusString'),
    );
  }

  // 선택적: enum을 문자열로 쉽게 변환하는 메서드
  String get name => toString().split('.').last;
}
