//도서관
//Book 클래스를 만들고 title, author 및 genre와 같은 속성을 포함합니다.
//Fiction 및 NonFiction과 같은 Book 클래스의 하위 클래스를 만듭니다.
//Fiction 클래스에 subgenre 속성을 추가합니다.
//NonFiction 클래스에 subject 속성을 추가합니다.
class Book {
  String title;
  String author;
  String genre;
  String bookId;

  Book(
    this.title,
    this.author,
    this.genre,
    this.bookId,
  );

  void openBook() {
    print('책을 뜯었습니다.');
  }

  void checkRefund() {
    print('오픈시 환불불가');
  }
}

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
