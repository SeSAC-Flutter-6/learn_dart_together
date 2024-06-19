import 'dart:convert';
import 'package:learn_dart_together/11_json/practice/department.dart';
import 'dart:io';

Department fromJsonFile(String path) {
  final target = File(path);
  Map<String, dynamic> json = jsonDecode(target.readAsStringSync());
  return Department.fromJson(json);
}
