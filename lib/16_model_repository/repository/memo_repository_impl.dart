import '../model/memo.dart';
import './memo_repository.dart';

class MemoRepositoryImpl implements MemoRepository {
  List<Memo> memos = [];
  int i = 0;

  @override
  Future<Memo> createMemo(String s) async {
    i++;
    memos.add(Memo(id: i, content: s));
    return Memo(id: i, content: s);
  }

  @override
  Future<List<Memo>> getAllMemos() async {
    return memos;
  }

  @override
  Future<void> updateMemo(Memo memo) async {
    for (final m in memos) {
      if (m.id == memo.id) {
        m.content = memo.content;
        break;
      }
    }
  }

  @override
  Future<void> deleteMemo(int id) async {
    memos.removeWhere((memo) => memo.id == id);
  }
}
