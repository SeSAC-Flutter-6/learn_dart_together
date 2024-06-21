Future main() async {
  order(
      name: '홍길동',
      coffeeName: '다방커피',
      callback: (message) {
        print(message);
      });

  print(await getName());
  print(await getName());
  print(getName()); //함수라기 보다 future라는 객체다 (await붙여주기 전에)
  print(getName()); //Future 타입을 toString 해서 호출된다

  getName().then((_) => print('then'));

  var data = await Future.value('Hello');
  var name = await getName();
}

// String getName(){
Future<String> getName() async {
  //1초 대기  await 안쓰면?
  await Future.delayed(Duration(seconds: 1));
  //생성자, 1초걸리는 코드 임의로 만듦
  //1초 대기했다가 홍길동을 리턴하는 함수
  print('홍길동');
  return '홍길동';
}

void order({
  required String name,
  required String coffeeName,
  required void Function(String message) callback,
}) {
  callback?.call('완성되었습니다');
}
