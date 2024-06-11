class Book {
  String _title;
  String _author;
  String _genre;

  Book(this._title, this._author, this._genre);

  String get title => _title;

  String get author => _author;

  String get genre => _genre;

  void set title(String title) {
    _title = title;
  }

  void set author(String author) {
    _author = author;
  }

  void set genre(String genre) {
    _genre = genre;
  }
}

class Fiction extends Book {
  String _subGenre;

  Fiction(String title, String author, String genre, this._subGenre)
      : super(title, author, genre);

  String get subGenre => _subGenre;
}

class NonFiction extends Book {
  String _subject;

  NonFiction(String title, String author, String genre, this._subject)
      : super(title, author, genre);

  String get subject => _subject;
}
