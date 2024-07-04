import 'package:collection/collection.dart';

class Book {
  final int id;
  final String title;
  final String author;
  final int recent;
  final String isbn;
  final String genre;
  final bool bestseller;
  final List<Review> reviews;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.recent,
    required this.isbn,
    required this.genre,
    required this.bestseller,
    required this.reviews,
  });

  Book copyWith({
    int? id,
    String? title,
    String? author,
    int? recent,
    String? isbn,
    String? genre,
    bool? bestseller,
    List<Review>? reviews,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      recent: recent ?? this.recent,
      isbn: isbn ?? this.isbn,
      genre: genre ?? this.genre,
      bestseller: bestseller ?? this.bestseller,
      reviews: reviews ?? this.reviews,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'author': author,
      'recent': recent,
      'isbn': isbn,
      'genre': genre,
      'bestseller': bestseller,
      'reviews': reviews.map((x) => x.toJson()).toList(),
    };
  }

  factory Book.fromJson(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int,
      title: map['title'] as String,
      author: map['author'] as String,
      recent: map['recent'] as int,
      isbn: map['isbn'] as String,
      genre: map['genre'] as String,
      bestseller: map['bestseller'] as bool,
      reviews: List<Review>.from(
        (map['reviews'] as List<dynamic>).map<Review>(
          (x) => Review.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toString() {
    return 'Book(id: $id, title: $title, author: $author, recent: $recent, isbn: $isbn, genre: $genre, bestseller: $bestseller, reviews: $reviews)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.title == title &&
        other.author == author &&
        other.recent == recent &&
        other.isbn == isbn &&
        other.genre == genre &&
        other.bestseller == bestseller &&
        listEquals(other.reviews, reviews);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        author.hashCode ^
        recent.hashCode ^
        isbn.hashCode ^
        genre.hashCode ^
        bestseller.hashCode ^
        reviews.hashCode;
  }
}

class Review {
  final String reviewer;
  final String comment;
  final int rating;

  Review({
    required this.reviewer,
    required this.comment,
    required this.rating,
  });

  Review copyWith({
    String? reviewer,
    String? comment,
    int? rating,
  }) {
    return Review(
      reviewer: reviewer ?? this.reviewer,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'reviewer': reviewer,
      'comment': comment,
      'rating': rating,
    };
  }

  factory Review.fromJson(Map<String, dynamic> map) {
    return Review(
      reviewer: map['reviewer'] as String,
      comment: map['comment'] as String,
      rating: map['rating'] as int,
    );
  }

  @override
  String toString() =>
      'Review(reviewer: $reviewer, comment: $comment, rating: $rating)';

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;

    return other.reviewer == reviewer &&
        other.comment == comment &&
        other.rating == rating;
  }

  @override
  int get hashCode => reviewer.hashCode ^ comment.hashCode ^ rating.hashCode;
}
