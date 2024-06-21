import 'file_read.dart';

void main() async {
  final String source = './lib/15_async/practice_1/sample.csv';
  final String target = './lib/15_async/practice_1/sample_copy.csv';

  await fileRead(source, target, '한석봉', '김석봉');
}
