import 'package:learn_dart_together/13_model/data/model/memo.dart';

abstract interface class MemoRepository {
  Future<Memo> createMemo(String body);

  Future<List<Memo>> getAllMemos();

  Future<void> updateMemo(Memo memo);

  Future<void> deleteMemo(int memoId);
}
