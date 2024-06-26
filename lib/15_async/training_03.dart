// Future.timeout(시간) 함수를 사용하면
// Future가 특정 시간안에 종료되지 않았을 때 타임아웃 처리를 할 수 있다
// 다음 Future 함수를 실행하고 5초 이내에 완료되지 않으면 "timeout" 을 출력하시오
Future<void> main() async {
  Future<void> getTimeout() async {
    //5초 동안 기다리자
    await Future.delayed(Duration(seconds: 5));
    print('시작');
  }

  try {
    final timeout = await getTimeout().timeout(Duration(seconds: 3));
  } catch (e) {
    print('타임아웃');
  }

}
