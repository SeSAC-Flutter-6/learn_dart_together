import 'dart:io';

import 'package:learn_dart_together/20_design/model/book.dart';
import 'package:learn_dart_together/20_design/model/member.dart';

bool isValidPhoneNumber(String phoneNumber) {
  return RegExp(r'^\d{3}-\d{4}-\d{4}$').hasMatch(phoneNumber);
}

bool isValidDate(String birthDate) {
  return RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(birthDate);
}

Future<List<Member>> csvToList(String csvFile) async {
  final list = (await File(csvFile).readAsLines()).sublist(1);
  return list.map((e) => Member.fromCsv(e)).toList();
}

Future<List<Book>> csvToBookList(String filePath) async {
  final file = File(filePath);
  if (!await file.exists()) {
    throw FileSystemException('CSV 파일을 찾을 수 없습니다: $filePath');
  }

  final lines = await file.readAsLines();
  final books = <Book>[];

  for (var i = 1; i < lines.length; i++) {
    final values = lines[i].split(',');
    if (values.length >= 6) {
      books.add(Book(
        id: int.parse(values[0]),
        title: values[1],
        author: values[2],
        summary: values[3],
        publishedDate: DateTime.parse(values[4]),
        isBorrowable: values[5].toLowerCase() == 'true',
      ));
    }
  }

  return books;
}
