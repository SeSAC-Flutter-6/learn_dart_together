import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/data_source/borrow_info_data_source.dart';
import 'package:learn_dart_together/24_architecture/book_management_program/model/borrow_info.dart';

class BorrowInfoDataSourceImpl implements BorrowInfoDataSource {
  Future<List<List<dynamic>>> _getFile() async {
    final file = await File(
            'lib/24_architecture/book_management_program/data/borrow_info_data.csv')
        .openRead()
        .transform(utf8.decoder)
        .transform(CsvToListConverter())
        .toList();
    return file;
  }

  @override
  Future<void> addBorrowInfo(BorrowInfo borrowInfo) async {
    final file = await _getFile();
    final result = File(
        'lib/24_architecture/book_management_program/data/borrow_info_data.csv');
    file.add(borrowInfo.toJson().values.toList());
    String csvContent = const ListToCsvConverter().convert(file);
    await result.writeAsString(csvContent);
  }

  @override
  Future<void> deleteBorrowInfo(BorrowInfo borrowInfo) async {
    final result = File(
        'lib/24_architecture/book_management_program/data/borrow_info_data.csv');
    final allFile = await _getFile();
    final first = allFile[0];
    final file = allFile.sublist(1);
    final List<BorrowInfo> borrowInfoList =
        file.map((e) => BorrowInfo.fromList(e)).toList();
    borrowInfoList.removeWhere((e) => e.id == borrowInfo.id);
    final csvList =
        borrowInfoList.map((e) => e.toJson().values.toList()).toList();
    csvList.insert(0, first);
    String csvContent = const ListToCsvConverter().convert(csvList);
    await result.writeAsString(csvContent);
  }

  @override
  Future<List<BorrowInfo>> getBorrowInfo() async {
    final allFile = await _getFile();
    final file = allFile.sublist(1);

    final List<BorrowInfo> borrowInfoList =
        file.map((e) => BorrowInfo.fromList(e)).toList();
    return borrowInfoList;
  }

  @override
  Future<void> updateBorrowInfo(BorrowInfo borrowInfo) async {
    final result = File(
        'lib/24_architecture/book_management_program/data/borrow_info_data.csv');
    final allFile = await _getFile();
    final first = allFile[0];
    final file = allFile.sublist(1);
    final List<BorrowInfo> borrowInfoList =
        file.map((e) => BorrowInfo.fromList(e)).toList();
    final index = borrowInfoList.indexWhere((e) => e.id == borrowInfo.id);
    borrowInfoList[index] = borrowInfo;
    final csvList =
        borrowInfoList.map((e) => e.toJson().values.toList()).toList();
    csvList.insert(0, first);
    String csvContent = const ListToCsvConverter().convert(csvList);
    await result.writeAsString(csvContent);
  }
}
