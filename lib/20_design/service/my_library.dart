import 'dart:io';
import 'package:learn_dart_together/20_design/mock_data_source/mock_member_data_source.dart';
import 'package:learn_dart_together/20_design/repository_impl/member_repository_impl.dart';
import 'package:learn_dart_together/20_design/service/member_management.dart';
import 'package:learn_dart_together/20_design/repository/member_repository.dart';

class MyLibrary {
  late final MemberManagement _memberManagement;
  // late final BookManagement _bookManagement;

  MyLibrary(MemberRepository memberRepository) {
    _memberManagement = MemberManagement(this, memberRepository);
    // _bookManagement = BookManagement(this, bookRepository);
  }

  Future<void> displayMain() async {
    while (true) {
      print('1. 회원관리   2. 도서관리   3. 대출/반납/연장   4. 백업   5. 백업 데이터 복원   6. 종료');
      final input = stdin.readLineSync()!;
      switch (input) {
        case '1':
          await _memberManagement.manageMember();
          break;
        case '2':
          //
          break;
        case '3':
          //
          break;
        case '4':
          await saveFile();
          break;
        case '5':
          await restoreData();
          break;
        case '6':
          exit(0);
        default:
          print('숫자(1~6)를 입력하세요.');
      }
    }
  }

  Future<void> saveFile() async {
    print('백업 파일을 저장할 경로를 입력하세요.');
    final input = stdin.readLineSync()!;
    final path = input.endsWith('/') ? input : '$input/';
    final memberFile =
        '/Users/caliapark/Desktop/Practice/lib/20_design/data/member_data.csv';
    await File('${path}member_data').copy(memberFile);
  }

  Future<void> restoreData() async {
    print('불러올 백업 파일의 경로를 입력하세요.');
    final input = stdin.readLineSync()!;
    await File(
            '/Users/caliapark/Desktop/Practice/lib/20_design/data/member_data.csv')
        .copy(input);
  }
}

Future<void> main() async {
  var a = MyLibrary(MemberRepositoryImpl(MockMemberDataSource()));
  await a.displayMain();
}
