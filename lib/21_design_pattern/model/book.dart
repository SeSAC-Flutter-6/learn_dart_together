import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  const Book._(); // 이 줄을 추가합니다.

  const factory Book({
    int? id,
    required String title,
    required String author,
    required String isbn,
    required DateTime? publishedDate,
  }) = _Book;

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, isbn: $isbn, publishedDate: ${publishedDate != null ? '${publishedDate?.year}/${publishedDate?.month}/${publishedDate?.day}' : 'null'})';
  }

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

// 확장 메서드로 fromCsv와 toCsv 구현
extension BookCsvExtension on Book {
  static Book fromCsv(List<String> parts) {
    // final parts = csv.split(',');

    return Book(
      id: int.parse(parts[0]),
      title: parts[1],
      author: parts[2],
      isbn: parts[3],
      publishedDate: DateTime.tryParse(parts[4]),
    );
  }

  String toCsv() {
    return '$id,$title,$author,$isbn,$publishedDate';
  }
}
