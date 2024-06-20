Future<void> main() async {
  order(
      name: '홍길동',
      coffeeName: '아메리카노',
      callback: (message) {
        print(message.substring(5, 10));
      });

  getName().then((_) => print('then'));

  var data = await Future.value('Hello');

  print(await getName());
  print(await getName());
  print(await getName());
}

Future<String> getName() async {
  // 1초 대기
  await Future.delayed(Duration(seconds: 1));
  return '홍길동';
}

void order({
  required String name,
  required String coffeeName,
  required void Function(String message)? callback,
}) {
  //널러블 아니면 call 생략가능
  callback?.call('$name님 주문하신 $coffeeName가 완성되었습니다.');
}
