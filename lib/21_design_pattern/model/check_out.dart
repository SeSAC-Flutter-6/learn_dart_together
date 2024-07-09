import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_out.freezed.dart';
part 'check_out.g.dart';

@freezed
class CheckOut with _$CheckOut {
  const CheckOut._();

  const factory CheckOut({
    int? id,
    int? bookId,
    int? userId,
    DateTime? checkOutDate,
    DateTime? dueDate,
    DateTime? returnDate,
    int? extensionCount,
  }) = _CheckOut;

  factory CheckOut.fromJson(Map<String, Object?> json) =>
      _$CheckOutFromJson(json);

  @override
  String toString() {
    return 'CheckOut(id: $id, bookId: $bookId, userId: $userId, checkOutDate: ${checkOutDate != null ? '${checkOutDate?.year}/${checkOutDate?.month}/${checkOutDate?.day}' : 'null'}, dueDate: ${dueDate != null ? '${dueDate?.year}/${dueDate?.month}/${dueDate?.day}' : 'null'}, returnDate: ${returnDate != null ? '${returnDate?.year}/${returnDate?.month}/${returnDate?.day}' : 'null'}, extensionCount: $extensionCount)';
  }
}

extension CheckOutCsvExtension on CheckOut {
  static CheckOut fromCsv(List<String> parts) {
    return CheckOut(
      id: int.parse(parts[0]),
      bookId: int.parse(parts[1]),
      userId: int.parse(parts[2]),
      checkOutDate: DateTime.tryParse(parts[3]),
      dueDate: DateTime.tryParse(parts[4]),
      returnDate: DateTime.tryParse(parts[5]),
      extensionCount: int.parse(parts[6]),
    );
  }

  String toCsv() {
    return '$id,$bookId,$userId,$checkOutDate,$dueDate,$returnDate,$extensionCount';
  }
}
