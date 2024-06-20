import 'dart:io';

Future<void> main() async {
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
