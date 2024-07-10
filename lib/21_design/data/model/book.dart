import 'package:freezed_annotation/freezed_annotation.dart';

  part 'book.freezed.dart';

  part 'book.g.dart';

  @freezed
  class Book with _$Book {
    const factory Book({
  required int id,
  required String title,
  required String author,
  required DateTime publishedAt,
  required String isbn,
    }) = _Book;

    factory Book.fromJson(Map<String, Object?> json) => _$BookFromJson(json);
  }
