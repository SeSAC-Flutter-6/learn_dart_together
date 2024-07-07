import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/book_data_source.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/book.dart';

class BookDataSourceImpl implements BookDataSource {
  Future<List<List<dynamic>>> _getFile() async {
    final file = await File(
            'lib/24_architecture/book_management_program/data/book_data.csv')
        .openRead()
        .transform(utf8.decoder)
        .transform(CsvToListConverter())
        .toList();
    return file;
  }

  @override
  Future<List<Book>> getBooks() async {
    final allFile = await _getFile();
    final file = allFile.sublist(1);

    final List<Book> bookList =
        file.map((e) => Book.fromJson(Book.fromList(e).toJson())).toList();
    return bookList;
  }

  @override
  Future<void> addBook(Book book) async {
    final file = await _getFile();
    final result =
        File('lib/24_architecture/book_management_program/data/book_data.csv');
    file.add(book.toJson().values.toList());
    String csvContent = const ListToCsvConverter().convert(file);
    await result.writeAsString(csvContent);
  }

  @override
  Future<void> updateBook(Book book) async {
    final result =
        File('lib/24_architecture/book_management_program/data/book_data.csv');
    final allFile = await _getFile();
    final first = allFile[0];
    final file = allFile.sublist(1);
    final List<Book> bookList =
        file.map((e) => Book.fromJson(Book.fromList(e).toJson())).toList();
    final index = bookList.indexWhere((e) => e.id == book.id);
    bookList[index] = book;
    final csvList = bookList.map((e) => e.toJson().values.toList()).toList();
    csvList.insert(0, first);
    String csvContent = const ListToCsvConverter().convert(csvList);
    await result.writeAsString(csvContent);
  }

  @override
  Future<void> deleteBook(Book book) async {
    final result =
        File('lib/24_architecture/book_management_program/data/book_data.csv');
    final allFile = await _getFile();
    final first = allFile[0];
    final file = allFile.sublist(1);
    final List<Book> bookList =
        file.map((e) => Book.fromJson(Book.fromList(e).toJson())).toList();
    bookList.removeWhere((e) => e.id == book.id);
    final csvList = bookList.map((e) => e.toJson().values.toList()).toList();
    csvList.insert(0, first);
    String csvContent = const ListToCsvConverter().convert(csvList);
    await result.writeAsString(csvContent);
  }
}

void main() async {
  final book = Book(
      id: 1,
      title: '생존코딩',
      publishDate: '2024/12/22',
      author: '오준석',
      isBorrowable: true);

  // print(await BookDataSourceImpl().getBooks());
  // await BookDataSourceImpl().addBook(book);
  await BookDataSourceImpl().deleteBook(book);
  // await BookDataSourceImpl().updateBook(book);
}
