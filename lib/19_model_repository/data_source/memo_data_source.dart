import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/19_model_repository/model/memo.dart';

class MemoDataSource {
  Future<List<Memo>> getData() async {
    File file = File('lib/19_model_repository/memo.json');
    final data = jsonDecode(await file.readAsString()) as List;
    return data.map((e) => Memo.fromJson(e)).toList();
  }
}
