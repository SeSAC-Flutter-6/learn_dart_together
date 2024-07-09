import 'dart:io';

import 'package:learn_dart_together/21_design_pattern/data_source/check_out_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/model/check_out.dart';
import 'package:learn_dart_together/21_design_pattern/repository/library_repository_impl.dart';

Future<void> checkOutManagement() async {
  // CheckOutDataSource checkOutDataSource = CheckOutDataSource();
  LibraryRepositoryImpl libraryRepository = LibraryRepositoryImpl();

  while (true) {
    print('0.뒤로   1.대출이력 조회   2.대출이력 등록   3.대출이력 수정   4.대출이력 삭제   5.대출 연장');
    stdout.write('선택: ');
    String choice = stdin.readLineSync()!;
    switch (choice) {
      case '0':
        return;
      case '1':
        print('대출 목록:');
        (await libraryRepository.getDueCheckOuts()).forEach(print);
        print('\n대출 조회가 완료되었습니다.');
        break;
      case '2':
        print('대출정보를 입력해주세요.');
        print('도서 id: ');
        String bookId = stdin.readLineSync()!;
        print('회원 id: ');
        String userId = stdin.readLineSync()!;

        final data = (await libraryRepository.createCheckOut(
          CheckOut(
            bookId: int.parse(bookId),
            userId: int.parse(userId),
            checkOutDate: DateTime.now(),
            returnDate: null,
          ),
        ));
        print(data);
        break;
      case '3':
        print('대출수정할 ID를 입력해주세요.');
        int id = int.parse(stdin.readLineSync()!);
        print('대출정보를 입력해주세요.');
        print('도서 id: ');
        String bookId = stdin.readLineSync()!;
        print('회원 id: ');
        String userId = stdin.readLineSync()!;
        print('대출일(yyyy-MM-dd): ');
        String checkOutDate = stdin.readLineSync()!;
        print('반납일(yyyy-MM-dd): ');
        String returnDate = stdin.readLineSync()!;
        print('연장횟수: ');
        String extensionCount = stdin.readLineSync()!;

        final data = (await libraryRepository.updateCheckOut(
          CheckOut(
              id: id,
              bookId: int.tryParse(bookId),
              userId: int.tryParse(userId),
              checkOutDate: DateTime.tryParse(checkOutDate),
              dueDate: DateTime.tryParse(checkOutDate)!.add(Duration(days: 7)),
              returnDate: DateTime.tryParse(returnDate),
              extensionCount: int.tryParse(extensionCount)),
        ));
        print(data);
        break;
      case '4':
        print('대출삭제할 ID를 입력해주세요.');
        int id = int.parse(stdin.readLineSync()!);
        final data = (await libraryRepository.deleteCheckOut(id));
        print(data);
        break;
      case '5':
        print('대출 연장할 ID를 입력해주세요.');
        int id = int.parse(stdin.readLineSync()!);
        final data = (await libraryRepository.extendDueDate(id));
        print(data);
        break;
      default:
        print('잘못된 선택입니다. 다시 시도해주세요.');
    }
    print(''); // 각 작업 후 빈 줄 추가로 가독성 향상
  }
}
