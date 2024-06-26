import '../model/memo.dart';

class MemoRepositoryImpl implements MemoRepository {
  @override
  Future<Memo> createMemo(String message) {
    // TODO: implement createMemo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteMemo(int id) {
    // TODO: implement deleteMemo
    throw UnimplementedError();
  }

  @override
  Future<List<Memo>> getAllMemos() {
    // TODO: implement getAllMemos
    throw UnimplementedError();
  }

  @override
  Future<void> updateMemo(Memo memo) {
    // TODO: implement updateMemo
    throw UnimplementedError();
  }
}

abstract interface class MemoRepository {
  Future<Memo> createMemo(String message);

  Future<List<Memo>> getAllMemos();

  Future<void> updateMemo(Memo memo);

  Future<void> deleteMemo(int id);
}
