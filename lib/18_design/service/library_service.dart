import 'dart:io';

import 'package:learn_dart_together/18_design/service/manage/book_manage.dart';
import 'package:learn_dart_together/18_design/service/manage/user_manage.dart';

import '../controller/file_controller.dart';

class LibraryService {
  UserManage userService;
  BookManage bookManage;
  FileController fileController;

  LibraryService(this.fileController, this.userService, this.bookManage);

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
          ['id', 'title', 'extensionCount', 'checkoutStatus', 'publishedData']
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

    final path = 'lib/18_design/assets/';
    await folderCheck(path);

    for ((String, List<List<String>>) data in createFileList) {
      final filePath = '$path${data.$1}';

      // 파일이 생성되었는지 확인
      File file = File(filePath);
      if (!(await file.exists())) {
        await fileController.initialize(filePath, data.$2);
        print('파일 생성 완료: $filePath');
      }
    }
  }

  Future<void> folderCheck(String path) async {
    Directory directory = Directory(path);
    if (!await directory.exists()) await directory.create(recursive: true);
  }

  Future<void> start() async {
    await initialize();

    while (true) {
      print('1. 회원관리\t\t2. 도서관리\t\t 3. 대출관리\t\t 4.종료');
      final input = stdin.readLineSync();
      switch (input) {
        case '1':
          await userService.manage();
          break;
        case '2':
          await bookManage.manage();
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
