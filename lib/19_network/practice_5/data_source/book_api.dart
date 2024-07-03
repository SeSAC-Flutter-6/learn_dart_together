import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/19_network/practice_5/data_source/book_data_source.dart';
import 'package:learn_dart_together/19_network/practice_5/model/book.dart';

class BookApi implements BookDataSource {
  final String _baseUrl;

  BookApi(
      {String url =
          'https://a0fd254a-71a4-4377-9458-7d420ab3dbc4.mock.pstmn.io'})
      : _baseUrl = url;

  @override
  Future<Book> createBook(Book book) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/books'),
      body: jsonEncode(book.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    return Book.fromJson(jsonDecode(response.body));
  }

  @override
  Future<Book> deleteBook(Book book) async {
    final response = await http.delete(Uri.parse('$_baseUrl/books/${book.id}'));
    return Book.fromJson(jsonDecode(response.body));
  }

  @override
  Future<Book> getBook(Book book) async {
    final response = await http.get(Uri.parse('$_baseUrl/books/${book.id}'));
    return Book.fromJson(jsonDecode(response.body));
  }

  @override
  Future<List<Book>> getBooks() async {
    final response = await http.get(Uri.parse('$_baseUrl/books'));
    return (jsonDecode(response.body)['books'] as List)
        .map((itemJson) => Book.fromJson(itemJson))
        .toList();
  }

  @override
  Future<Book> updateBook(Book book) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/books/${book.id}'),
      body: jsonEncode(book.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    return Book.fromJson(jsonDecode(response.body));
  }
}
