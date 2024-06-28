import '../model/memo.dart';

class MemoDataSource {
  final List<Memo> _memos = [];

  Future<List<Memo>> get memos async => List.unmodifiable(_memos);

  Future<void> addMemo(Memo memo) async {
    _memos.add(memo);
  }

  Future<void> updateMemo(Memo memo) async {
    final index = _memos.indexWhere((m) => m.id == memo.id);
    if (index != -1) {
      _memos[index] = memo;
    }
  }

  Future<void> deleteMemo(Memo memo) async {
    _memos.removeWhere((e) => e.id == memo.id);
  }
}
