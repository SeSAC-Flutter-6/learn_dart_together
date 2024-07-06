import 'dart:io';
import 'dart:math';

import 'package:learn_dart_together/18_design/core/result.dart';
import 'package:learn_dart_together/18_design/data/model/book.dart';
import 'package:learn_dart_together/18_design/data/repository_impl/book_repository_impl.dart';
import 'package:learn_dart_together/18_design/utils/parse_published_date.dart';

class BookManage {
  final BookRepositoryImpl _bookRepositoryImpl;

  BookManage(this._bookRepositoryImpl);

  Future<void> manage() async {
    print(
        '0. 뒤로\t\t1. 도서조회\t\t2. 도서등록\t\t 3. 도서수정\t\t 4. 도서삭제\t\t5. 삭제취소\t\t6. 최간 출간된 도서 조회');
    final input = stdin.readLineSync();
    while (true) {
      switch (input) {
        case '0':
          return;
        case '1':
          final books = await getBooks();
          if (books.isEmpty) {
            print('아무 도서도 없습니다.');
          } else {
            print(books);
          }
          return;
        case '2':
          await createBook();
          return;
        case '3':
          await updateBook();
          return;
        case '4':
          await deleteBook();
          return;
        case '5':
          await cancelDelete();
          return;
        case '6':
          await getBooksBySortedRecent();
          return;
        case _:
          print('잘못된 입력');
          return;
      }
    }
  }

  Future<List<Book>> getBooks() async {
    final getBooksResult = await _bookRepositoryImpl.getBooks();
    switch (getBooksResult) {
      case Success(:final data):
        return data;
      case Error(:final e):
        print(e);
    }
    return [];
  }

  Future<List<Book>> getBooksBySortedRecent() async {
    final getBooksResult = await _bookRepositoryImpl.getBooksSortedByRecent();
    switch (getBooksResult) {
      case Success(:final data):
        return data;
      case Error(:final e):
        print(e);
    }
    return [];
  }

  Future<void> createBook() async {
    final books = await getBooks();
    int id = 1;
    for (Book book in books) {
      id = max(book.id, id);
    }
    id += 1;

    print('도서 등록 시작');
    print('제목을 입력해주세요');
    final title = stdin.readLineSync() ?? '';

    print('출간날짜를 입력해주세요 ex)19961216');
    String publishedDate;
    DateTime date;
    while (true) {
      publishedDate = stdin.readLineSync() ?? '';
      if (!isValidatePublishedDate(publishedDate)) {
        print('잘못된 형식을 입력했습니다.');
        continue;
      }

      date = parsePublishedDate(publishedDate);
      break;
    }

    final newBook = Book(
      id: id,
      title: title,
      checkoutStatus: CheckoutStatus.readied,
      publishedData: date,
    );

    final createBookResult = await _bookRepositoryImpl.createBook(newBook);
    switch (createBookResult) {
      case Success(:final data):
        print(data);
      case Error(:final e):
        print(e);
    }
  }

  Future<Book> findByName() async {
    while (true) {
      print('찾을 도서 이름을 입력해주세요.');
      final targetName = stdin.readLineSync() ?? '';
      final findByNameResult = await _bookRepositoryImpl.findByName(targetName);
      switch (findByNameResult) {
        case Success(:final data):
          return data;
        case Error(:final e):
          print('찾으려는 도서가 없습니다. 다시 입력해주세요.');
      }
    }
  }

  Future<void> updateBook() async {
    final books = await getBooks();
    if (books.isEmpty) {
      print('갱신 할 도서가 없습니다.');
      return;
    }
    print(books);

    final targetBook = await findByName();

    print('도서의 정보를 모두 새로 입력합니다.');
    print('제목을 입력해주세요');
    final title = stdin.readLineSync() ?? '';

    final updateBookResult = await _bookRepositoryImpl.updateBook(
        targetBook.id, targetBook.copyWith(title: title));

    switch (updateBookResult) {
      case Success(:final data):
        print(data);
      case Error(:final e):
        print(e);
        throw Exception(e);
    }
  }

  Future<void> deleteBook() async {
    final books = await getBooks();
    if (books.isEmpty) {
      print('삭제 할 도서가 없습니다.');
      return;
    }
    print(books);

    final targetBook = await findByName();
    switch (await _bookRepositoryImpl.deleteBook(targetBook.id)) {
      case Success(:final data):
        print('삭제가 완료되었습니다.');
      case Error(:final e):
        print(e);
    }
  }

  Future<void> cancelDelete() async {
    switch (await _bookRepositoryImpl.cancelDelete()) {
      case Success(:final data):
        print('삭제가 취소되었습니다.');
      case Error(:final e):
        print('직전의 파일만 복구할 수 있습니다. 또는 이미 복구 되었습니다.');
    }
  }
}
