import 'dart:io';
import 'package:csv/csv.dart';
import 'package:learn_dart_together/23_design_pattern/model/book.dart';

class BookCsvApi {
  Future<void> saveBook(List<Book> bookList) async {
    List<List<String>> csvTable = [
      ['id', 'title', 'publishDate', 'isLoanable', 'returnDate']
    ];

    bookList.forEach((book) {
      List<String> bookData = [
        book.id.toString(),
        book.title,
        book.publishDate.toIso8601String(),
        book.isLoanable.toString(),
        book.returnDate.toIso8601String(),
      ];
      csvTable.add(bookData);
    });

    final csvData = ListToCsvConverter().convert(csvTable);

  await File('books.csv').writeAsString(csvData);
  print('도서 목록이 파일에 저장되었습니다.');
  }
}


