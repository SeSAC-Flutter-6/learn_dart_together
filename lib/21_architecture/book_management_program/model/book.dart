import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';

part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required int id,
    required String title,
    required String publishDate,
    required String author,
    required bool isBorrowable,
  }) = _Book;

  factory Book.fromJson(Map<String, Object?> json) => _$BookFromJson(json);

  factory Book.fromList(List<dynamic> list) {
    return Book(
      id: list[0],
      title: list[1],
      publishDate: list[2],
      author: list[3],
      isBorrowable: bool.parse(list[4]),
    );
  }
}
