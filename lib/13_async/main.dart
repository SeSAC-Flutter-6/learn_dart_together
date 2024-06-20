void main() async {
  order(
    name: '줍알',
    coffee: '모카',
    callback: (message) {
      print(message.substring(0, 1));
    },
  );

  print(await getName()); // 퓨처 타입 함수 쓰려면 await 붙여야함
  print(await getName()); // await는 퓨처 함수 내에서만 쓰일 수 있음
  print(await getName()); // Future - async - await 세트

  var data = await Future.value('Hello'); // await 안붙이면 Future<String> 타입
}

Future<String> getName() async {
  // 1초 대기
  await Future.delayed(Duration(seconds: 1)); // await 안쓰면 리턴 먼저 실행됨
  return 'Hallo';
}

void order({
  required String name,
  required String coffee,
  required void Function(String message) callback,
}) {
  // sth
  callback('$name님 주문하신 $coffee 나왔습니다.');
}
