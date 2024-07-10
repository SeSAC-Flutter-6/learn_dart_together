import 'dart:io';
import 'package:learn_dart_together/23_design_pattern/model/book.dart';
import 'package:learn_dart_together/23_design_pattern/repository/book_repository.dart';
class BookUI {
  final BookRepository bookRepository;

  BookUI(this.bookRepository);

  Future<void> bookManagement() async {
    bool running = true;
    while (running) {
      printBookMenu();
      String? userInput = stdin.readLineSync()?.trim();

      switch (userInput) {
        case '1':
          print('도서 대출 목록');
          await showBooks();
          break;
        case '2':
          print('도서 추가');
          await addBook();
          break;
        case '3':
          print('도서 삭제');
          await deleteBook();
          break;
        case '4':
          await saveBooksToFile();
          running = false;
          break;
        default:
          print('올바른 옵션을 선택하세요.');
          break;
      }
    }
  }

  void printBookMenu() {
    print('======== 도서 관리 ========');
    print('1. 도서 대출 목록');
    print('2. 도서 추가');
    print('3. 도서 삭제');
    print('4. 저장 후 종료');
    print('===========================');
    print('원하는 작업의 번호를 입력하세요.');
  }

  Future<void> showBooks() async {
    try {
      List<Book> books = bookRepository.getBooksSortedByPublishedDate();
      if (books.isEmpty) {
        print('등록된 도서가 없습니다.');
      } else {
        print('===== 도서 목록 =====');
        books.forEach((book) {
          print('ID: ${book.id}, 제목: ${book.title}, 출판일: ${formatDate(book.publishDate)},');
        });
        print('===================');
        await bookRepository.saveBooks();
     print('사용자 목록이 CSV 파일에 저장되었습니다.');
      }
    } catch (e) {
      print('도서 목록을 가져오는 중 오류가 발생했습니다: $e');
    }
  }

  Future<void> addBook() async {
    try {
      print('도서 제목을 입력하세요:');
      String? title = stdin.readLineSync()?.trim();
      if (title == null || title.isEmpty) {
        print('도서 제목을 입력해야 합니다.');
        return;
      }

      print('출판일을 입력하세요 (YYYYMMDD):');
      String? publishDateInput = stdin.readLineSync()?.trim();
      if (publishDateInput == null || publishDateInput.isEmpty || publishDateInput.length != 8 || !isNumeric(publishDateInput)) {
        print('올바른 출판일을 입력해야 합니다.');
        return;
      }

      int id = bookRepository.generateBookId();
      String year = publishDateInput.substring(0, 4);
      String month = publishDateInput.substring(4, 6);
      String day = publishDateInput.substring(6, 8);

      Book newBook = Book(
        id: id,
        title: title,
        publishDate: DateTime(int.parse(year), int.parse(month), int.parse(day)),
        isLoanable: true,
        returnDate: DateTime.now(), 
      );

      bookRepository.addBookInformation(newBook);
       await bookRepository.saveBooks();
      print('도서가 추가되었습니다: ${newBook.title}');
    } catch (e) {
      print('도서 추가 중 오류가 발생했습니다: $e');
    }
  }

  Future<void> deleteBook() async {
    try {
      print('삭제할 도서의 ID를 입력하세요:');
      String? idInput = stdin.readLineSync()?.trim();
      if (idInput == null || idInput.isEmpty || !isNumeric(idInput)) {
        print('올바른 도서 ID를 입력해야 합니다.');
        return;
      }

      int id = int.parse(idInput);
      Book? bookToDelete = bookRepository.getBookById(id);
      if (bookToDelete == null) {
        print('해당 ID의 도서를 찾을 수 없습니다.');
        return;
      }

      bookRepository.deleteBook(id);
      await bookRepository.saveBooks();
      print('도서가 삭제되었습니다: ${bookToDelete.title}');
    } catch (e) {
      print('도서 삭제 중 오류가 발생했습니다: $e');
    }
  }

  Future<void> saveBooksToFile() async {
    try {
      await bookRepository.saveBooks();
      print('도서 목록이 파일에 저장되었습니다.');
    } catch (e) {
      print('도서 목록을 파일에 저장하는 중 오류가 발생했습니다: $e');
    }
  }

  bool isNumeric(String s) {
    return int.tryParse(s) != null;
  }

  String formatDate(DateTime date) {
    return '${date.year}/${_twoDigits(date.month)}/${_twoDigits(date.day)}';
  }

  String _twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }
}