import 'package:learn_dart_together/16_model_repository/repository/memo_repository_impl.dart';

void main() async {
  final repository = MemoRepositoryImpl();

  // Create a new memo.
  final memo = await repository.createMemo('This is a new memo.');
  print('Created memo: $memo');

  // Get all memos.
  final memos = await repository.getAllMemos();
  for (final memo in memos) {
    print('Memo: $memo');
  }

  // Update a memo.
  memo.content = 'This is an updated memo.';
  await repository.updateMemo(memo);
  print('Updated memo: $memo');

  // Delete a memo.
  await repository.deleteMemo(memo.id);
  print('Deleted memo with ID: ${memo.id}');
}
