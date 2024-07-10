import 'dart:convert';
import 'dart:io';

import '../model/book.dart';

//
// final String jsonBookString = '''[
//   {
//   "id": 1,
//     "title": "Harry Potter",
//     "author" : "abbie",
//     "publishedAt" : "2012-07-02",
//     "isbn" : 1212
//   }
//   {
//   "id": 2,
//     "title": "Harry Potter : series 2",
//     "author" : "abbie",
//     "publishedAt" : "2014-12-12",
//     "isbn" : 1212
//   }
//   {
//   "id": 3,
//     "title": "Harry Potter : series 3",
//     "author" : "abbie",
//     "publishedAt" : "2018-10-15",
//     "isbn" : 1212
//   }
// ]''';
//
// List<String> jsonBookStringList = jsonDecode(jsonBookString);

class BooksApi {
  Future<List<dynamic>> loadBooksFromFile(String filePath) async {
    // 파일 내용 읽기
    final file = File(filePath);
    final contents = await file.readAsString();

    // Json 파싱
    List<dynamic> jsonBookStringList = jsonDecode(contents);

    return jsonBookStringList;
    //Json을 Book 객체 리스트로 변환
  }

  Future<void> updateBooksFromFile(
      String filePath, List<Book> updatedBookList) async {
    final file = File(filePath);

    // 기존 데이터에 새로운 책 추가
    final jsonList = updatedBookList.map((e) => e.toJson()).toList();

    // 파일에 새로운 데이터 쓰기
    await file.writeAsString(jsonEncode(jsonList), mode: FileMode.write);
  }
}
