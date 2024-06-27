import 'package:learn_dart_together/15_model_respository/data_source/memo_data_source.dart';
import 'package:learn_dart_together/15_model_respository/model/memo.dart';

class MemoRepository {
  final _dataSource = MemoDataSource();
  int _id = 0;

  Future<Memo> createMemo(String content) async {
    _id++;
    final memo = Memo(id: _id, content: content);
    await _dataSource.addMemo(memo);
    return memo;
  }

  Future<List<Memo>> getAllMemos() async {
    return await _dataSource.memos;
  }

  Future<Memo> updateMemo(Memo memo) async {
    await _dataSource.updateMemo(memo);
    return memo;
  }

  Future<void> deleteMemo(Memo memo) async {
    await _dataSource.deleteMemo(memo);
  }
}
