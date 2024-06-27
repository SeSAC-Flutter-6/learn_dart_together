import '../model/memo.dart';

abstract interface class MemoRepository {
  Future<Memo> createMemo(String memo);

  Future<List<Memo>> getAllMemos();

  Future<void> updateMemo(String memo);

  Future<void> deleteMemo(int id);
}
