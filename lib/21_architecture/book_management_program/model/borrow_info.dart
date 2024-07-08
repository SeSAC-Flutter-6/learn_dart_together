import 'package:freezed_annotation/freezed_annotation.dart';

part 'borrow_info.freezed.dart';

part 'borrow_info.g.dart';

@freezed
class BorrowInfo with _$BorrowInfo {
  const factory BorrowInfo({
    required int id,
    required int bookId,
    required String bookTitle,
    required int userId,
    required String userName,
    required bool isExtendable,
    required String borrowDate,
    required String dueDate,
  }) = _BorrowInfo;

  factory BorrowInfo.fromJson(Map<String, Object?> json) =>
      _$BorrowInfoFromJson(json);

  factory BorrowInfo.fromList(List<dynamic> list) {
    return BorrowInfo(
      id: list[0],
      bookId: list[1],
      bookTitle: list[2],
      userId: list[3],
      userName: list[4],
      isExtendable: bool.parse(list[5]),
      borrowDate: list[6],
      dueDate: list[7],
    );
  }
}
