import 'package:learn_dart_together/07_Instance_control/copyable.dart';

class Book implements Comparable {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.comment,
    DateTime? publishDate,
  }) : publishDate = publishDate ?? DateTime.now();

  /// == 메서드 재정의
  /// 타입, title, publishDate(년, 월, 일)이 동일한지 비교
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate.year == other.publishDate.year &&
          publishDate.month == other.publishDate.month &&
          publishDate.day == other.publishDate.day;

  /// Comparable 인터페이스 구현.
  /// DateTime publishDate로 우선순위 비교
  @override
  int compareTo(other) => publishDate.compareTo(other.publishDate) * -1;

  /// Book 인스턴스 복사하여 반환
  copyWith({
    String? title,
    String? comment,
    DateTime? publishDate,
  }) {
    return Book(
        title: title ?? this.title,
        comment: comment ?? this.comment,
        publishDate: publishDate
    );
  }
}
