Future<void> main() async {
  print(await getName());
  print(await getName());
  print(await getName());

  getName().then((_)=>print('then')); // 잘 안씀. 순서가 보장되지 않아서

}

//커피 주문
// callback : 함수의 형태로 알려주는데 뭔가가 input쪽으로 거꾸로 돌아오는 것
//끝났을때 알려주는 콜백함수
void order(
    {required String name,
    required String coffeeName,
    required void Function(String message) callback}) {
  //만들어
  callback('$name님 주문하신 $coffeeName이 완성되었습니다. .');
}

Future<String> getName() async {
  // Future<String> 하면 일반함수처럼 쓸 수 없고, Future 라는 다른 객체
  await Future.delayed(Duration(seconds: 2)); // await 를 쓰지 않으면 '홍길동'을 먼저 리턴함
  return '홍길동';
}
