import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/19_model_repository/data_source/memo_data_source.dart';
import 'package:learn_dart_together/19_model_repository/model/memo.dart';

class MemoRepository {
  final MemoDataSource _memoDataSource;
  final filePath = 'lib/19_model_repository/memo.json';

  MemoRepository(this._memoDataSource);

  // Future<Memo> createMemo(String content) {
  //   _memos.add(content);
  // }

  Future<List<Memo>> getAllMemos() async {
    return await _memoDataSource.getData();
  }

  // Future updateMemo() {
  //   return
  // }
  //
  Future<void> deleteMemo(int id) async {
    final data = await _memoDataSource.getData();
    final deletedMemo = data.where((e) => e.id != id).toList();
    final file = jsonEncode(deletedMemo.map((e)=>e.toJson()).toList());
    final result = File(filePath);
    await result.writeAsString(file);
  }
}
