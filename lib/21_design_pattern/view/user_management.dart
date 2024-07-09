import 'dart:io';

import 'package:learn_dart_together/21_design_pattern/data_source/user_data_source.dart';
import 'package:learn_dart_together/21_design_pattern/model/user.dart';
import 'package:learn_dart_together/21_design_pattern/repository/user_repository_impl.dart';

Future<void> userManagement() async {
  // UserDataSource userDataSource = UserDataSource();
  UserRepositoryImpl userDataSource = UserRepositoryImpl();

  while (true) {
    print('0.뒤로   1.회원조회   2.회원등록   3.회원수정   4.회원삭제');
    stdout.write('선택: ');
    String? choice = stdin.readLineSync();
    print('입력된 값: $choice'); // 디버깅을 위한 출력
    if (choice == null) {
      print('입력이 null입니다. 다시 시도해주세요.');
      continue;
    }

    switch (choice) {
      case '0':
        return;
      case '1':
        print('회원 목록:');
        (await userDataSource.getUsers()).forEach(print);
        print('\n회원 조회가 완료되었습니다.');
        break;
      case '2':
        print('회원정보를 입력해주세요.');
        print('이름: ');
        String name = stdin.readLineSync()!;
        print('휴대폰: ');
        String phone = stdin.readLineSync()!;
        print('주소: ');
        String address = stdin.readLineSync()!;
        print('생년월일(yyyy-MM-dd): ');
        String birthday = stdin.readLineSync()!;
        // print('가입일(yyyy-MM-dd): ');
        // String createdAt = stdin.readLineSync()!;
        final data = (await userDataSource.createUser(User(
          name: name,
          phone: phone,
          address: address,
          birthday: DateTime.tryParse(birthday),
          createdAt: DateTime.now(),
        )));
        print(data);
        break;
      case '3':
        print('회원수정할 ID를 입력해주세요.');
        int id = int.parse(stdin.readLineSync()!);
        print('회원정보를 입력해주세요.');
        print('이름: ');
        String name = stdin.readLineSync()!;
        print('휴대폰: ');
        String phone = stdin.readLineSync()!;
        print('주소: ');
        String address = stdin.readLineSync()!;
        print('생년월일(yyyy-MM-dd): ');
        String birthday = stdin.readLineSync()!;
        print('가입일(yyyy-MM-dd): ');
        String createdAt = stdin.readLineSync()!;
        final data = (await userDataSource.updateUser(User(
          id: id,
          name: name,
          phone: phone,
          address: address,
          birthday: DateTime.tryParse(birthday),
          createdAt: DateTime.tryParse(createdAt),
        )));
        print(data);
        break;
      case '4':
        print('회원삭제할 ID를 입력해주세요.');
        int id = int.parse(stdin.readLineSync()!);
        final data = (await userDataSource.deleteUser(id));
        print(data);
        break;
      default:
        print('잘못된 선택입니다. 다시 시도해주세요.');
    }
  }
}
