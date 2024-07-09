import 'dart:io';
import 'package:learn_dart_together/20_design/mock_data_source/mock_book_data_source.dart';
import 'package:learn_dart_together/20_design/mock_data_source/mock_checkout_data_source.dart';
import 'package:learn_dart_together/20_design/mock_data_source/mock_member_data_source.dart';
import 'package:learn_dart_together/20_design/repository/book_repository.dart';
import 'package:learn_dart_together/20_design/repository/checkout_repository.dart';
import 'package:learn_dart_together/20_design/repository_impl/book_repository_impl.dart';
import 'package:learn_dart_together/20_design/repository_impl/checkout_repository_impl.dart';
import 'package:learn_dart_together/20_design/repository_impl/member_repository_impl.dart';
import 'package:learn_dart_together/20_design/service/book_management.dart';
import 'package:learn_dart_together/20_design/service/checkout_management.dart';
import 'package:learn_dart_together/20_design/service/member_management.dart';
import 'package:learn_dart_together/20_design/repository/member_repository.dart';
import 'package:learn_dart_together/20_design/utils/constant.dart';

class MyLibrary {
  late final MemberManagement _memberManagement;
  late final BookManagement _bookManagement;
  late final CheckoutManagement _checkoutManagement;

  MyLibrary(
    MemberRepository memberRepository,
    BookRepository bookRepository,
    CheckoutRepository checkoutRepository,
  ) {
    _memberManagement = MemberManagement(this, memberRepository);
    _bookManagement = BookManagement(this, bookRepository);
    _checkoutManagement = CheckoutManagement(this, checkoutRepository);
  }

  Future<void> displayMain() async {
    while (true) {
      print('1. 회원관리   2. 도서관리   3. 대출/반납/연장   4. 백업   5. 백업 데이터 불러오기   6. 종료');
      final input = stdin.readLineSync()!;
      switch (input) {
        case '1':
          await _memberManagement.manageMember();
          break;
        case '2':
          await _bookManagement.manageBook();
          break;
        case '3':
          await _checkoutManagement.manageCheckout();
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
          break;
      }
    }
  }

  Future<void> saveFile() async {
    print('백업 파일을 저장할 경로를 입력하세요.');
    final input = stdin.readLineSync()!;
    final path = input.endsWith('/') ? input : '$input/';

    final directory = Directory(path);
    if (!await directory.exists()) {
      print('경로가 존재하지 않습니다: $path');
      return;
    }
    try {
      await File(memberCsvFile).copy('${path}member_data.csv');
      await File(bookCsvFile).copy('${path}book_data.csv');
      await File(checkoutCsvFile).copy('${path}checkout_data.csv');
      print('파일이 성공적으로 저장되었습니다.');
    } catch (e) {
      print('파일 저장 중 오류가 발생했습니다: $e');
    }
  }

  Future<void> restoreData() async {
    try {
      print('불러올 회원정보 파일의 경로를 입력하세요.');
      final memberBackup = stdin.readLineSync();
      print('불러올 도서정보 파일의 경로를 입력하세요.');
      final bookBackup = stdin.readLineSync();
      print('불러올 대여/반납정보 파일의 경로를 입력하세요.');
      final checkoutBackup = stdin.readLineSync();

      if (memberBackup == null ||
          bookBackup == null ||
          checkoutBackup == null) {
        throw Exception('모든 파일 경로를 입력해야 합니다.');
      }

      await _copyFile(memberBackup, memberCsvFile, '회원정보');
      await _copyFile(bookBackup, bookCsvFile, '도서정보');
      await _copyFile(checkoutBackup, checkoutCsvFile, '대여/반납정보');

      await Future.wait([
        _memberManagement.restoreMembers(),
        _bookManagement.restoreBooks(),
        _checkoutManagement.restoreCheckouts(),
      ]);

      print('데이터 복원이 완료되었습니다.');
    } catch (e) {
      print('데이터 복원 중 오류가 발생했습니다: $e');
    }
  }

  Future<void> _copyFile(String source, String storage, String data) async {
    if (await File(source).exists()) {
      await File(source).copy(storage);
    } else {
      throw Exception('$data 파일을 찾을 수 없습니다: $source');
    }
  }
}

Future<void> main() async {
  final memberDataSource = MockMemberDataSource();
  final bookDataSource = MockBookDataSource();
  final checkoutDataSource = MockCheckoutDataSource();

  final myLibrary = MyLibrary(
    MemberRepositoryImpl(memberDataSource),
    BookRepositoryImpl(bookDataSource),
    CheckoutRepositoryImpl(
        checkoutDataSource, memberDataSource, bookDataSource),
  );
  await myLibrary.displayMain();
}
