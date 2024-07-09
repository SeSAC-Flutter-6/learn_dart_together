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
      print('1. 회원관리   2. 도서관리   3. 대출/반납/연장   4. 백업   5. 백업 데이터 복원   6. 종료');
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
      }
    }
  }

  Future<void> saveFile() async {
    print('백업 파일을 저장할 경로를 입력하세요.');
    final input = stdin.readLineSync()!;
    final path = input.endsWith('/') ? input : '$input/';

    await File('${path}member_data.csv').copy(memberCsvFile);
    await File('${path}book_data.csv').copy(bookCsvFile);
    await File('${path}checkout_data.csv').copy(checkoutCsvFile);
  }

  Future<void> restoreData() async {
    print('불러올 백업 파일의 경로를 입력하세요.');
    final input = stdin.readLineSync()!;

    await File(memberCsvFile).copy(input);
    await File(bookCsvFile).copy(input);
    await File(checkoutCsvFile).copy(input);
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
