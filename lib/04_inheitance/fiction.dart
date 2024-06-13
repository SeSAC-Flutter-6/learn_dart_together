import 'package:learn_dart_together/04_inheitance/library.dart';

class Fiction extends Book {
  String subgenre; //하위 장르
  String creativity; //창의성
  String imagination; //상상력

  Fiction(
      super.title,
      super.author,
      super.genre,
      super.bookId,
      this.subgenre,
      this.creativity,
      this.imagination,
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