import 'dart:io';

import 'menu/book_menu.dart';
import 'menu/user_menu.dart';

void main() async {
  final userMenu = UserMenu();
  final bookMenu = BookMenu();

  while (true) {
    int mainMenu = _showMainMenu();
    if (mainMenu == 3) {
      print("프로그램을 종료합니다.");
      break;
    }

    if (mainMenu == 1) {
      await userMenu.showUserMenu();
    } else if (mainMenu == 2) {
      bookMenu.showBookMenu();
    } else {
      print("잘못된 입력입니다. 다시 선택해 주세요.");
    }
  }
}

int _showMainMenu() {
  print("1.회원관리  2.도서관리  3.종료");
  return int.parse(stdin.readLineSync()!);
}
