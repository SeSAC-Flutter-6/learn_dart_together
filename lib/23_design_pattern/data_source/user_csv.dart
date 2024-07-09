import 'dart:io';
import 'package:csv/csv.dart';
import 'package:learn_dart_together/23_design_pattern/model/user.dart';

class CsvApi {
  Future<void> saveUser(List<User> userList) async {
    List<List<String>> csvTable = [
      ['id', 'name', 'address', 'birth', 'isMember', 'createdAt', 'loanBooks', 'gender']
    ];

    userList.forEach((element) {
      List<String> user = [
        element.id.toString(),
        element.name,
        element.address,
        element.birth.toIso8601String(),
        element.isMember.toString(),
        element.createdAt.toIso8601String(),
        element.loanBooks.map((book) => book.title).join(', '),
        element.gender.toString().split('.').last,
      ];
      csvTable.add(user);
    });

    final csvData = ListToCsvConverter().convert(csvTable);
    await File('user.csv').writeAsString(csvData);
  }
}

 Future<void> saveDeletedUsers(List<User> deletedUserList) async {
    List<List<String>> csvTable = [
      ['id', 'name', 'address', 'birth', 'isMember', 'createdAt', 'loanBooks', 'gender', 'deletedAt']
    ];

    deletedUserList.forEach((element) {
      List<String> user = [
        element.id.toString(),
        element.name,
        element.address,
        element.birth.toIso8601String(),
        element.isMember.toString(),
        element.createdAt.toIso8601String(),
        element.loanBooks.map((book) => book.title).join(', '),
        element.gender.toString().split('.').last,
        DateTime.now().toIso8601String(), // 삭제된 시간 추가
      ];
      csvTable.add(user);
    });

    final csvData = ListToCsvConverter().convert(csvTable);
    await File('deleted_users.csv').writeAsString(csvData);
    print('삭제된 사용자 목록이 파일에 저장되었습니다.');
  }
