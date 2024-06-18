import 'employee.dart';
import 'department.dart';
import 'dart:io';
import 'to_json_file.dart';
import 'from_json_file.dart';

void main() {
  Department headLeader = Department('총무부', Employee('홍길동', 41));
  toJsonFile(
      headLeader, '${Directory.current.path}/lib/11_json/practice/company.txt');

  Department headLeaderFromFile = fromJsonFile(
      '${Directory.current.path}/lib/11_json/practice/company2.txt');
  print(headLeaderFromFile);
}
