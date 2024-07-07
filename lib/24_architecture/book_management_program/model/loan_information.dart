import 'package:freezed_annotation/freezed_annotation.dart';

part 'loan_information.freezed.dart';

part 'loan_information.g.dart';

@freezed
class LoanInformation with _$LoanInformation {

  const factory LoanInformation({
    required int id,
    required int bookId,
    required String bookTitle,
    required int userId,
    required String userName,
    required bool isExtendable,
    required DateTime borrowDate,
    required DateTime dueDate,
    required DateTime? returnDate,
  }) = _LoanInformation;

  factory LoanInformation.fromJson(Map<String, Object?> json) => _$LoanInformationFromJson(json);
}