import 'package:learn_dart_together/19_model_repository/data_source/memo_data_source.dart';
import 'package:learn_dart_together/19_model_repository/repository/memo_repository.dart';

void main() async {
  final repository = MemoRepository(MemoDataSource());

  // //Create a new memo.
  // final memo = await repository.createMemo('This is a new memo.');
  // print('Created memo: $memo');

  //Get all memos.
  final memos = await repository.getAllMemos();
  for (final memo in memos) {
    print('Memo: $memo');
  }

  // //Update a memo.
  // memo.content = 'This is an updated memo.';
  // await repository.updateMemo(memo);
  // print('Updated memo: $memo');
  //
  //Delete a memo.
  await repository.deleteMemo(1);
  print('Deleted memo with ID: ${1}');
}
