import 'dart:io';

class BookMenu {
  void showBookMenu() {
    while (true) {
      print('0.뒤로  1.도서조회  2.도서등록  3.도서수정  4.도서삭제  5.삭제취소');
      int subMenu = int.parse(stdin.readLineSync()!);

      if (subMenu == 0) {
        break;
      }

      switch (subMenu) {
        case 1:
          print("도서 조회 기능 실행");
          // 도서 조회 기능
          break;
        case 2:
          print("도서 등록 기능 실행");
          // 도서 등록 기능
          break;
        case 3:
          print("도서 수정 기능 실행");
          // 도서 수정 기능
          break;
        case 4:
          print("도서 삭제 기능 실행");
          // 도서 삭제 기능
          break;
        case 5:
          print("삭제 취소 기능 실행");
          // 삭제 취소 기능
          break;
        default:
          print("잘못된 입력입니다. 다시 선택해 주세요.");
      }
    }
  }
}
