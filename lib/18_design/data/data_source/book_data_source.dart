import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fast_csv/csv_converter.dart';
import 'package:learn_dart_together/18_design/data/mapper/book_mapper.dart';
import 'package:learn_dart_together/18_design/data/model/book.dart';

class BookDataSource {
  static const _fileName = 'book_file.csv';
  static const _path = 'lib/18_design/assets/$_fileName';

  Future<List<Book>> getBooks() async {
    try {
      final input = File(_path);
      final data = await input.readAsString();
      final fields = CsvConverter().convert(data);

      fields.removeAt(0);

      return fields.map((row) => Book.fromCsv(row)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Book?> getBook(int id) async {
    try {
      final input = File(_path);
      final data = await input.readAsString();
      final fields = CsvConverter().convert(data);

      fields.removeAt(0);

      return fields
          .map((row) => Book.fromCsv(row))
          .singleWhereOrNull((book) => book.id == id);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Book> createBook(Book book) async {
    try {
      final input = File(_path);
      await input.writeAsString(
        '\n${BookMapper(book).toCSV()}',
        mode: FileMode.append,
        encoding: utf8,
      );
      return book;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Book> deleteBook(int id) async {
    try {
      final book = await getBook(id);
      if (book == null) throw Exception('book not found');

      final input = File(_path);
      final tempFile = File('lib/18_design/assets/temp_$_fileName');
      final lines = await input.readAsLines();
      final target = BookMapper(book).toCSV();

      final result = lines
          .where((line) => line.trim().isNotEmpty && line != target)
          .join('\n');

      await input.writeAsString(result, encoding: utf8,);
      await tempFile.writeAsString(target, encoding: utf8,);

      return book;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Book> updateBook(int targetId, Book book) async {
    try {
      final input = File(_path);
      final lines = await input.readAsLines();
      final targetBook = await getBook(targetId);
      if (targetBook == null) throw Exception('book not found');

      final target = BookMapper(targetBook).toCSV();
      final goal = BookMapper(book).toCSV();

      final result = lines.map((line) {
        if (line == target) {
          return goal;
        }
        return line;
      }).toList();

      await input.writeAsString(result.join('\n'), encoding: utf8,);

      return book;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> cancelDelete() async {
    try {
      final mainFile = File(_path);
      final tempFile = File('lib/18_design/assets/temp_$_fileName');

      if (!await tempFile.exists()) {
        throw Exception('파일이 없습니다.');
      }

      final deletedLine = await tempFile.readAsString();

      await mainFile.writeAsString('\n$deletedLine', mode: FileMode.append, encoding: utf8,);

      await tempFile.delete();
    } catch (e) {
      throw Exception(e);
    }
  }
}
