import '../model/memo.dart';

abstract interface class MemoRepository {
  Future<Memo> createMemo(String s);
  Future<List<Memo>> getAllMemos();
  Future<void> updateMemo(Memo memo);
  Future<void> deleteMemo(int id);
}
