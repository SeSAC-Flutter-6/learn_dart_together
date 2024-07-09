import 'dart:io';
import 'package:learn_dart_together/23_design_pattern/repository/book_repository_impl.dart';
import 'package:learn_dart_together/23_design_pattern/repository/user_repository_impl.dart';
import 'package:learn_dart_together/23_design_pattern/services/user_ui.dart';
import 'package:learn_dart_together/23_design_pattern/services/book_ui.dart';

void main() async {
  var userRepository = UserRepositoryImpl(); 
var bookRepository = BookRepositoryImpl();


  bool running = true;
  while (running) {
    mainQuestion();
    String? userInput = stdin.readLineSync()?.trim();

    switch (userInput) {
      case '1':
        await UserUI(userRepository).userManagement(); 
      case '2':
        await BookUI(bookRepository).bookManagement(); 
        break;
      case '3':
        running = false;
        break;
      default:
        print('올바른 옵션을 선택하세요.');
        break;
    }
  }
  print('프로그램을 종료합니다.');
}

void mainQuestion() {
  print('======== 하려는 작업을 선택하세요 ========');
  print('1. 회원 정보 관리');
  print('2. 도서 대출 관리');
  print('3. 아웃');
  print('====================================');
  print('원하는 작업의 번호를 입력하세요.');
}



