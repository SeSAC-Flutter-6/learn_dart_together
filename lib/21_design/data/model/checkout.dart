import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';
import 'book.dart';

part 'checkout.freezed.dart';

part 'checkout.g.dart';

@freezed
class CheckOut with _$CheckOut {
  const factory CheckOut({
    required int id,
    required Book book,
    required User user,
    required DateTime checkOutDate,
    required DateTime dueDate,
    required DateTime? returnDate,
    required int extensionCount,
  }) = _CheckOut;
  
  factory CheckOut.fromJson(Map<String, Object?> json) => _$CheckOutFromJson(json);
}