import 'dart:io';
import 'package:learn_dart_together/20_design/model/book.dart';
import 'package:learn_dart_together/20_design/model/checkout.dart';
import 'package:learn_dart_together/20_design/model/member.dart';

String? validateInput(String prompt) {
  print(prompt);
  final input = stdin.readLineSync();
  if (input == null || input.isEmpty) {
    print('잘못된 입력: 입력이 유효하지 않습니다.');
    return null;
  }
  return input;
}

int? validateId(String prompt) {
  final input = validateInput(prompt);
  if (input == null) return null;

  final id = int.tryParse(input);
  if (id == null) {
    print('잘못된 입력: 유효한 숫자를 입력하세요.');
    return null;
  }
  return id;
}

bool isValidPhoneNumber(String phoneNumber) {
  return RegExp(r'^\d{3}-\d{4}-\d{4}$').hasMatch(phoneNumber);
}

bool isValidDate(String birthDate) {
  return RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(birthDate);
}

Future<List<Book>> csvToBookList(String filePath) async {
  final file = File(filePath);
  if (!await file.exists()) {
    throw FileSystemException('CSV 파일을 찾을 수 없습니다: $filePath');
  }

  final lines = await file.readAsLines();
  final books = <Book>[];

  for (var i = 1; i < lines.length; i++) {
    final values = lines[i].split(',');
    if (values.length >= 6) {
      books.add(Book(
        id: int.parse(values[0]),
        title: values[1],
        author: values[2],
        summary: values[3],
        publishedDate: DateTime.parse(values[4]),
        isBorrowable: values[5].toLowerCase() == 'true',
      ));
    }
  }
  return books;
}

Future<List<Member>> csvToMemberList(String filePath) async {
  final file = File(filePath);
  if (!await file.exists()) {
    throw FileSystemException('CSV 파일을 찾을 수 없습니다: $filePath');
  }

  final lines = await file.readAsLines();
  final members = <Member>[];

  for (var i = 1; i < lines.length; i++) {
    final values = lines[i].split(',');
    if (values.length >= 6) {
      members.add(Member(
        id: int.parse(values[0]),
        name: values[1],
        address: values[2],
        phoneNumber: values[3],
        birthDate: DateTime.parse(values[4]),
        registrationDate: DateTime.parse(values[5]),
      ));
    }
  }
  return members;
}

Future<List<Checkout>> csvToCheckoutList(String filePath) async {
  final file = File(filePath);
  if (!await file.exists()) {
    throw FileSystemException('CSV 파일을 찾을 수 없습니다: $filePath');
  }

  final lines = await file.readAsLines();
  final checkouts = <Checkout>[];

  for (var i = 1; i < lines.length; i++) {
    final values = lines[i].split(',');
    if (values.length >= 9) {
      checkouts.add(Checkout(
        id: int.parse(values[0]),
        memberId: int.parse(values[1]),
        memberName: values[2],
        bookId: int.parse(values[3]),
        bookTitle: values[4],
        borrowDate: DateTime.parse(values[5]),
        returnDate: DateTime.parse(values[6]),
        bookStatus: BookStatus.values.firstWhere(
          (status) => status.toString() == 'BookStatus.${values[7]}',
          orElse: () => BookStatus.unknown,
        ),
        isExtendable: values[8].toLowerCase() == 'true',
      ));
    }
  }
  return checkouts;
}
