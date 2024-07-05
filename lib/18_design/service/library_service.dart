import 'dart:io';

import 'package:learn_dart_together/18_design/service/user_manage.dart';

import '../controller/file_controller.dart';

class LibraryService {
  UserManage userService;
  FileController fileController;

  LibraryService(this.fileController, this.userService);

  Future<void> initialize() async {
    // (path, header in csv)
    final List<(String, List<List<String>>)> createFileList = [
      (
        'user_file.csv',
        [
          ['id', 'name', 'registedData', 'address', 'phone', 'birth']
        ]
      ),
      (
        'book_file.csv',
        [
          ['id', 'title', 'extensionCount', 'checkoutStatus']
        ]
      ),
      (
        'checkout_file.csv',
        [
          [
            'id',
            'userId',
            'bookId',
            'address',
            'isReturned',
            'checkoutDate',
            'returnDate'
          ]
        ]
      ),
    ];

    for ((String, List<List<String>>) data in createFileList) {
      final path = 'lib/18_design/assets/${data.$1}';
      await fileController.initialize(path, data.$2);

      // 파일이 생성되었는지 확인
      File file = File(path);
      if (!await file.exists()) {
        throw Exception('파일 생성 실패: $path');
      }
    }
    print('초기화 완료');
  }

  Future<void> start() async {
    // await initialize();

    while (true) {
      print('1. 회원관리\t\t2. 도서관리\t\t 3. 대출관리\t\t 4.종료');
      final input = stdin.readLineSync();
      switch (input) {
        case '1':
          await userService.manage();
          break;
        case '2':
          manageBook();
          break;
        case '3':
          manageCheckout();
          break;
        case '4':
          exit(0);
        case _:
          print('잘못된 입력');
          break;
      }
    }
  }

  void manageBook() {}

  void manageCheckout() {}
}
