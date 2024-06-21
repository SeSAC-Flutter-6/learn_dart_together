import 'dart:io';

Future<void> main() async {
  await copyWriteFile();

  copyWriteFile2();

  order(
    name: '홍길동',
    coffeeName: '다방커피',
    callback: (message) {
      print(message.substring(5, 10));
    },
  );

  // getName();
  // getName();
  // getName();

  getName().then((_) => print('then'));

  var data = await Future.value('Hello');

  var func = await getName();

  print(await getName());
  print(await getName());
  print(await getName());

  File file = File('');
}

Future<String> getName() async {
  // 1초 대기
  await Future.delayed(Duration(seconds: 1));

  print('홍길동');
  return '홍길동';
}

void order({
  required String name,
  required String coffeeName,
  void Function(String message)? callback,
}) {
  // 만들어
  callback?.call('$name님 주문하신$coffeeName가 완성되었습니다');
}

Future<void> copyWriteFile2() async {
  final File file = File('sample.csv');

  if (await file.exists()) {
    final fileText = await file.readAsString();
    final File newFile = File('sample_copy.csv');
    await newFile.writeAsString(fileText.replaceAll('한석봉', '김석봉'));
    print(await newFile.readAsString());
  } else {
    throw Exception('파일이 존재하지 않습니다.');
  }
}

Future<void> copyWriteFile() async {
  final File file = File('sample.csv');
  return file.exists().then((exist) async {
    if (exist) {
      final fileText = await file.readAsString();
      final File newFile = File('sample_copy.csv');
      await newFile.writeAsString(fileText.replaceAll('한석봉', '김석봉'));
      print(await newFile.readAsString());
    } else {
      throw Exception('파일이 존재하지 않습니다.');
    }
  });
}

// 연습문제 1.
Future<void> changeSB(String source, String target) async {
  try {
    final content = await File(source).readAsString();
    final modified = content.replaceAll('한석봉', '김석봉');
    await File(target).writeAsString(modified);
  } catch (e) {
    print('파일을 찾을 수 없습니다!');
  }
}