import 'dart:io';

import 'package:learn_dart_together/21_design_pattern/data_source/book_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/data_source/memory_data_source/memory_book_api.dart';
import 'package:learn_dart_together/21_design_pattern/data_source/mock_data_source/mock_book_api.dart';
import 'package:learn_dart_together/21_design_pattern/data_source/user_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/model/book.dart';
import 'package:learn_dart_together/21_design_pattern/model/user.dart';
import 'package:learn_dart_together/21_design_pattern/view/book_management.dart';
import 'package:learn_dart_together/21_design_pattern/view/check_out_management.dart';
import 'package:learn_dart_together/21_design_pattern/view/user_management.dart';

void main() async {
  BookDataSource bookDataSource = BookDataSource();
  UserDataSource userDataSource = UserDataSource();

  while (true) {
    print('1.회원관리    2.도서관리    3.대출관리    4. 종료');
    stdout.write('선택: ');
    String? choice = stdin.readLineSync();
    print('입력된 값: $choice'); // 디버깅을 위한 출력
    if (choice == null) {
      print('입력이 null입니다. 다시 시도해주세요.');
      continue;
    }
    switch (choice) {
      case '1':
        await userManagement();
        break;
      case '2':
        await bookManagement();
        break;
      case '3':
        await checkOutManagement();
        break;
      case '4':
        exit(0);
      default:
        print('잘못된 선택입니다. 다시 시도해주세요.');
    }
  }
}
