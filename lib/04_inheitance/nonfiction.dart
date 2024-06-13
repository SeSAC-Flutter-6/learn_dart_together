import 'package:learn_dart_together/04_inheitance/library.dart';

class NonFiction extends Book {
  String subject; //주제
  String reality; // 실제
  String infoTransfer; //정보전달
  String eduValue; // 교육가치

  NonFiction(
      super.title,
      super.author,
      super.genre,
      super.bookId,
      this.subject,
      this.reality,
      this.infoTransfer,
      this.eduValue,
      );

  @override
  void openBook() {
    print('책을 뜯었습니다.');
  }

  @override
  void checkRefund() {
    print('오픈시 환불불가');
  }
}
