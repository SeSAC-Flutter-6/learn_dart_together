import '../model/memo.dart';

void main() async {
  final repository = MemoRepository();

  final List<Memo> memos = await repository.getAllMemos();
  await repository.createMemo('message');
  print(memos.length);  // 1

  memos.clear();

  print(memos.length);
}

class MemoRepository {
  final List<Memo> _memos = [];
  int _nextId = 1;

  Future<Memo> createMemo(String message) async {
    final memo = Memo(id: _nextId, content: message);
    _memos.add(memo);
    _nextId++;
    return memo;
  }

  Future<void> deleteMemo(int id) async {
    _memos.removeWhere((memo) => memo.id == id);
  }

  Future<List<Memo>> getAllMemos() async {
    return List.unmodifiable(_memos);
  }

  Future<void> updateMemo(Memo memo) async {
    final index = _memos.indexWhere((e) => e.id == memo.id);
    if (index != -1) {
      _memos[index] = memo;
    } else {
      throw Exception('해당 메모는 없는 메모입니다');
    }
  }
}
