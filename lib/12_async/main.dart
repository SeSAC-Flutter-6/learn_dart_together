import 'dart:io';

Future<void> main() async {
  order(
    name: '홍길동',
    coffeeName: '다방커피',
    callback: (message) {
      print(message.substring(5, 10));
    },
  );

  //getName();
  //getName();
  //getName();
  getName().then((_) => print('then'));
  var data = await Future.value("hello");

  var func = await getName();

  print(await getName());
  print(await getName());
  print(await getName());

  File file = File('');

}

Future<String> getName() async {
  // 1초 대기 await 가 있으면 기다렸다가 출발(시작) 합니다!!
  // future 타입의 비동기 이지만 await를 붙이면 동기처럼 동작을 한다
 await Future.delayed(Duration(seconds: 1));

 print('홍길동');
 return '홍길동';
 }



void order({
      required String name,
      required String coffeeName,
      void Function(String message)? callback, //인풋쪽으로 거꾸로 돌아옴
  }) {
  //만들어

  callback?.call('$name님 주문하신 $coffeeName가 완성되었습니다.');

}



