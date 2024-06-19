import 'package:learn_dart_together/11_json/practice/department.dart';
import 'dart:io';
import 'dart:convert';

void toJsonFile(Department department, String path) {
  final target = File(path);
  target.writeAsStringSync(jsonEncode(department.toJson()));
}
