import 'dart:io';

import 'package:learn_dart_together/21_design_pattern/data_source/book_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/model/book.dart';
import 'package:learn_dart_together/21_design_pattern/repository/library_repository_impl.dart';

Future<void> bookManagement() async {
  // BookDataSource bookDataSource = BookDataSource();
  LibraryRepositoryImpl libraryRepository = LibraryRepositoryImpl();

  while (true) {
    print('0.뒤로   1.도서조회   2.도서등록   3.도서수정   4.도서삭제   5.삭제취소');
    stdout.write('선택: ');
    String choice = stdin.readLineSync()!;
    switch (choice) {
      case '0':
        return;
      case '1':
        print('도서 목록:');
        (await libraryRepository.getBooks()).forEach(print);
        print('\n도서 조회가 완료되었습니다.');
        break;
      case '2':
        print('도서정보를 입력해주세요.');
        print('도서명: ');
        String title = stdin.readLineSync()!;
        print('저자: ');
        String author = stdin.readLineSync()!;
        print('ISBN: ');
        String isbn = stdin.readLineSync()!;
        print('출판일(yyyy-MM-dd): ');
        String publishedDate = stdin.readLineSync()!;
        final data = (await libraryRepository.createBook(
          Book(
              title: title,
              author: author,
              isbn: isbn,
              publishedDate: DateTime.tryParse(publishedDate)),
        ));
        print(data);
        break;
      case '3':
        print('도서수정할 ID를 입력해주세요.');
        int id = int.parse(stdin.readLineSync()!);
        print('도서정보를 입력해주세요.');
        print('도서명: ');
        String title = stdin.readLineSync()!;
        print('저자: ');
        String author = stdin.readLineSync()!;
        print('ISBN: ');
        String isbn = stdin.readLineSync()!;
        print('출판일(yyyy-MM-dd): ');
        String publishedDate = stdin.readLineSync()!;
        final data = (await libraryRepository.updateBook(
          Book(
              id: id,
              title: title,
              author: author,
              isbn: isbn,
              publishedDate: DateTime.tryParse(publishedDate)),
        ));
        print(data);
        break;
      case '4':
        print('도서삭제할 ID를 입력해주세요.');
        int id = int.parse(stdin.readLineSync()!);
        final data = (await libraryRepository.deleteBook(id));
        print(data);
        break;
      case '5':
        print('삭제취소 기능은 아직 구현되지 않았습니다.');
        break;
      default:
        print('잘못된 선택입니다. 다시 시도해주세요.');
    }
    print(''); // 각 작업 후 빈 줄 추가로 가독성 향상
  }
}
