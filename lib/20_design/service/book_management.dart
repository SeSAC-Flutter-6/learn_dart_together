import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/20_design/model/book.dart';
import 'package:learn_dart_together/20_design/repository/book_repository.dart';
import 'package:learn_dart_together/20_design/service/my_library.dart';
import 'package:learn_dart_together/20_design/utils/function.dart';

class MemberManagement {
  final MyLibrary _myLibrary;
  final BookRepository _bookRepository;

  MemberManagement(this._myLibrary, this._bookRepository);

  Future<void> manageMember() async {
    while (true) {
      final input = _validateInput(
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
        final input = _validateInput('1. 제목순   2. 출간일순\n');
        if (input == null) return;

        final BookList = books.data;
        switch (input) {
          case '1':
            BookList.sort((a, b) => a.title.compareTo(b.title));
          case '2':
            BookList.sort((a, b) => a.publishedDate.compareTo(b.publishedDate));
          default:
            print('잘못된 입력: 숫자(1~2)를 입력하세요.');
            return;
        }
        BookList.forEach((book) => print(book.toInfo()));
        break;
      case Error():
        print(books.error);
        break;
    }
  }

  Future<void> searchBook() async {
    final input = _validateInput('검색할 도서 ID 또는 제목을 입력하세요.');
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
    final input = _validateInput(
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
    final id = _validateId('수정할 도서 ID를 입력하세요.');
    if (id == null) return;

    final input = _validateInput(
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
    final id = _validateId('삭제할 도서 ID를 입력하세요.');
    if (id == null) return;

    final book = await _bookRepository.deleteBook(id: id);
    _printResult(book, '도서정보를 삭제했습니다.');
  }
}

String? _validateInput(String prompt) {
  print(prompt);
  final input = stdin.readLineSync();
  if (input == null || input.isEmpty) {
    print('잘못된 입력: 입력이 유효하지 않습니다.');
    return null;
  }
  return input;
}

int? _validateId(String prompt) {
  final input = _validateInput(prompt);
  if (input == null) return null;

  final id = int.tryParse(input);
  if (id == null) {
    print('잘못된 입력: 유효한 숫자를 입력하세요.');
    return null;
  }
  return id;
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
