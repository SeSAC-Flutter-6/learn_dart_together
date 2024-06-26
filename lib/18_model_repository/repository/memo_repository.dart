import 'package:learn_dart_together/18_model_repository/model/memo.dart';

abstract interface class MemoRepository {
  Future<Memo> createMemo(String body);

  Future<List<Memo>> getAllMemos();

  Future<void> updateMemo(Memo memo);

  Future<void> deleteMemo(String memoId);
}
