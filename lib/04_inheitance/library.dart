//도서관
//Book 클래스를 만들고 title, author 및 genre와 같은 속성을 포함합니다.
//Fiction 및 NonFiction과 같은 Book 클래스의 하위 클래스를 만듭니다.
//Fiction 클래스에 subgenre 속성을 추가합니다.
//NonFiction 클래스에 subject 속성을 추가합니다.
class Book {
  String title;
  String author;
  String genre;

  Book(
    this.title,
    this.author,
    this.genre,
  );
}

class Fiction extends Book {
  String subgenre; //하위 장르

  Fiction(
    super.title,
    super.author,
    super.genre,
    this.subgenre,
  );
}

class NonFiction extends Book {
  String subject; //주제

  NonFiction(
    super.title,
    super.author,
    super.genre,
    this.subject,
  );
}
