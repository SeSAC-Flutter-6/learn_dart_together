enum Genre {
  melo,
  thriller,
  science
}

class Book {
  String title;
  Set<String> authors;
  Genre genre;

  Book({
    required this.title,
    required this.authors,
    required this.genre
  });
}