import 'dart:io';

import '../data/model/user.dart';
import '../data/repository_impl/user_repository_impl.dart';

class UserManage {
  UserRepositoryImpl userRepositoryImpl;

  UserManage(this.userRepositoryImpl);

  Future<void> manage() async {
    print('0. 뒤로\t\t1. 회원조회\t\t2. 회원등록\t\t 3. 회원수정\t\t 4. 회원삭제\t\t5. 삭제취소');
    final input = stdin.readLineSync();
    while (true) {
      switch (input) {
        case '0':
          return;
        case '1':
          print(await userRepositoryImpl.getUsers());
          return;
        case '2':
          await userRepositoryImpl.createUser(User(
            id: -1,
            name: 'testName',
            registedData: DateTime.parse('0001-01-01'),
            address: 'testAddress',
            phone: 'testPhone',
            birth: DateTime.parse('0001-01-01'),
          ));
          return;
        case '3':
          await userRepositoryImpl.updateUser(
              2,
              User(
                id: 2,
                name: '변경된이름',
                registedData: DateTime.parse('0001-01-01'),
                address: 'testAddress',
                phone: 'testPhone',
                birth: DateTime.parse('0001-01-01'),
              ));
          return;
        case '4':
          await userRepositoryImpl.deleteUser(5);
          return;
        case '5':
          await userRepositoryImpl.cancelDelete();
          return;
        case _:
          print('잘못된 입력');
          return;
      }
    }
  }
}
