import 'package:collection/collection.dart';
import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/model/book.dart';
import 'package:learn_dart_together/20_design/repository/book_repository.dart';
import 'package:learn_dart_together/20_design/service/my_library.dart';
import 'package:learn_dart_together/20_design/utils/function.dart';

class BookManagement {
  final MyLibrary _myLibrary;
  final BookRepository _bookRepository;

  BookManagement(
    this._myLibrary,
    this._bookRepository,
  );

  Future<void> manageBook() async {
    while (true) {
      final input = validateInput(
          '0. 뒤로   1. 도서조회   2. 도서검색   3. 도서등록   4. 도서수정   5. 도서삭제');
      if (input == null) continue;

      switch (input) {
        case '0':
          _myLibrary.displayMain();
          return;
        case '1':
          await getBooks();
          break;
        case '2':
          await searchBook();
          break;
        case '3':
          await registerBook();
          break;
        case '4':
          await updateBook();
          break;
        case '5':
          await deleteBook();
          break;
        default:
          print('잘못된 입력: 숫자(0~5)를 입력하세요.');
          break;
      }
    }
  }

  Future<void> getBooks() async {
    final books = await _bookRepository.getBook();
    switch (books) {
      case Success():
        final input = validateInput('1. 제목순   2. 출간일순   3. 대출가능도서');
        if (input == null) return;

        List<Book> bookList = [];
        switch (input) {
          case '1':
            bookList = books.data.sorted((a, b) => a.title.compareTo(b.title));
          case '2':
            bookList = books.data
                .sorted((a, b) => a.publishedDate.compareTo(b.publishedDate));
          case '3':
            bookList = books.data.where((book) => book.isBorrowable).toList();
          default:
            print('잘못된 입력: 숫자(1~3)를 입력하세요.');
            return;
        }
        bookList.forEach((book) => print(book.toInfo()));
        break;
      case Error():
        print(books.error);
        break;
    }
  }

  Future<void> searchBook() async {
    final input = validateInput('검색할 도서 ID 또는 제목을 입력하세요.');
    if (input == null) return;

    final id = int.tryParse(input);
    final books = await _bookRepository.getBook(id: id, title: input);
    switch (books) {
      case Success():
        books.data.forEach((book) => print(book.toInfo()));
      case Error():
        print(books.error);
    }
  }

  Future<void> registerBook() async {
    final input = validateInput(
        '등록할 도서 제목, 저자명, 내용, 출간일, 대출가능여부를 아래와 같이 입력하세요.\n데미안/헤르만 헤세/자기 자신을 찾기 위한 한 소년의 성장 이야기/1919-01-01/true');
    if (input == null) return;

    final list = input.split('/');
    if (list.length != 5 || !isValidDate(list[3])) {
      print('잘못된 입력: 예시 형식과 동일하게 입력하세요.');
      return;
    }
    final book = await _bookRepository.registerBook(
      title: list[0],
      author: list[1],
      summary: list[2],
      publishedDate: DateTime.parse(list[3]),
      isBorrowable: list[4] == 'true' ? true : false,
    );
    _printResult(book, '도서정보를 등록했습니다.');
  }

  Future<void> updateBook() async {
    final id = validateId('수정할 도서 ID를 입력하세요.');
    if (id == null) return;

    final input = validateInput(
        '수정할 도서 제목, 저자명, 내용, 출간일, 대출가능여부를 아래와 같이 입력하세요. 기존 정보를 유지하고 싶은 항목은 * 입력\n데미안/*/*/*/false');
    if (input == null) return;

    final list = input.split('/');
    if (list.length != 5 || (list[3] != '*' && !isValidDate(list[3]))) {
      print('잘못된 입력: 예시 형식과 동일하게 입력하세요.');
      return;
    }
    final book = await _bookRepository.updateBook(
      id: id,
      title: list[0] == '*' ? null : list[0],
      author: list[1] == '*' ? null : list[1],
      summary: list[2] == '*' ? null : list[2],
      publishedDate: list[3] == '*' ? null : DateTime.parse(list[3]),
      isBorrowable: list[4] == '*'
          ? null
          : list[4] == 'true'
              ? true
              : false,
    );
    _printResult(book, '도서정보를 수정했습니다.');
  }

  Future<void> deleteBook() async {
    final id = validateId('삭제할 도서 ID를 입력하세요.');
    if (id == null) return;

    final book = await _bookRepository.deleteBook(id: id);
    _printResult(book, '도서정보를 삭제했습니다.');
  }
}

void _printResult(Result<Book, String> result, String message) {
  switch (result) {
    case Success():
      print('${result.data.toInfo()} $message');
      break;
    case Error():
      print(result.error);
      break;
  }
}
