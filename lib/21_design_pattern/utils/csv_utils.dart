import 'dart:convert';
import 'dart:io';
import 'package:learn_dart_together/21_design_pattern/model/book.dart';
import 'package:learn_dart_together/21_design_pattern/model/user.dart';
import 'package:learn_dart_together/21_design_pattern/model/check_out.dart';

Future<List<List<String>>> readCsvFile(String filePath) async {
  final file = File(filePath);
  final lines = await file.readAsLines();
  return lines.skip(1).map((line) => line.split(',')).toList();
}

Future<void> writeCsvFile(String filePath, List<String> data) async {
  final file = File(filePath);

  String firstLine;
  final lines = await file.readAsLines();
  firstLine = lines.first;

  final sink = file.openWrite();

  sink.write(firstLine);
  sink.write('\n');

  for (var row in data) {
    sink.write(row);
    sink.write('\n');
  }

  await sink.close();
}

Future<List<List<String>>> readCsvData(String csvData) async {
  return csvData.split('\n').skip(1).map((line) => line.split(',')).toList();
}

String writeCsvData(String csvData, List<String> data) {
  final sink = StringBuffer();

  sink.write(csvData.split('\n').first);
  sink.write('\n');

  for (var i = 0; i < data.length; i++) {
    sink.write(data[i]);
    if (i < data.length - 1) {
      sink.write('\n');
    }
  }

  return sink.toString();
}
