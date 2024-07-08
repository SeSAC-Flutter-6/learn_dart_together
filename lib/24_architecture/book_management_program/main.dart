import 'dart:io';
import 'package:learn_dart_together/24_architecture/book_management_program/menu/book_menu.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/user.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/menu/user_menu.dart';

import 'menu/borrow_info_menu.dart';

User? deletedUser;

void main() {
  showFirstMenu();
}

void showFirstMenu() {
  print('1. 회원관리  2. 도서관리  3. 대출관리  4.종료');
  final data = stdin.readLineSync();
  switch (data) {
    case '':
      showFirstMenu();
    case '1':
      showUserMenu();
    case '2':
      showBookMenu();
    case '3':
      showBorrowInfoMenu();
    case '4':
      print('프로그램 종료');
      exit(0);
  }
}

void showUserMenu() async {
  print('0. 뒤로가기,  1. 회원목록  2. 회원등록  3.회원수정  4.회원삭제  5.회원검색  6.삭제취소');
  final data = stdin.readLineSync();
  switch (data) {
    case '':
      showUserMenu();
    case '0':
      showFirstMenu();
    case '1':
      await UserMenu().showUsers();
      showUserMenu();
    case '2':
      await UserMenu().registerUser();
      showUserMenu();
    case '3':
      await UserMenu().updateUser();
      showUserMenu();
    case '4':
      await UserMenu().deleteUser();
      showUserMenu();
    case '5':
      await UserMenu().findUser();
      showUserMenu();
    case '6':
      await UserMenu().cancelDelete();
      showUserMenu();
  }
}

void showBookMenu() async {
  print('0. 뒤로가기,  1. 도서목록  2. 도서등록  3.도서수정  4.도서삭제  5.도서검색');
  final data = stdin.readLineSync();
  switch (data) {
    case '':
      showBookMenu();
    case '0':
      showFirstMenu();
    case '1':
      await BookMenu().showBorrowableBooks();
      showBookMenu();
    case '2':
      await BookMenu().createBook();
      showBookMenu();
    case '3':
      await BookMenu().updateBook();
      showBookMenu();
    case '4':
      await BookMenu().deleteBook();
      showBookMenu();
    case '5':
      await BookMenu().findBook();
      showBookMenu();
  }
}

void showBorrowInfoMenu() async {
  print('0. 뒤로가기,  1. 대출목록  2. 대출  3.반납  4.연장');
  final data = stdin.readLineSync();
  switch (data) {
    case '0':
      showFirstMenu();
    case '1':
      await BorrowInfoMenu().showBorrowInfo();
      showBorrowInfoMenu();
    case '2':
      await BorrowInfoMenu().borrowBook();
      showBorrowInfoMenu();
    case '3':
      await BorrowInfoMenu().returnBook();
      showBorrowInfoMenu();
    case '4':
      await BorrowInfoMenu().renewBook();
      showBorrowInfoMenu();
  }
}
