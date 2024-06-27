import 'package:learn_dart_together/13_model_repository/data/model/memo.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/memo/memo_repository.dart';

class MemoRepositoryImpl implements MemoRepository {
  final List<Memo> _memos = [];
  int _nextId = 1;

  @override
  Future<Memo> createMemo(String message) async {
    final memo = Memo(id: _nextId, content: message);
    _memos.add(memo);
    _nextId++;
    return memo;
  }

  @override
  Future<void> deleteMemo(int id) async {
    _memos.removeWhere((memo) => memo.id == id);
  }

  @override
  Future<List<Memo>> getAllMemos() async {
    return List<Memo>.from(_memos);
  }

  @override
  Future<void> updateMemo(Memo memo) async {
    final index = _memos.indexWhere((e) => e.id == memo.id);
    if (index != -1) {
      _memos[index] = memo;
    } else {
      throw Exception('해당 메모는 없는 메모입니다');
    }
  }
}
