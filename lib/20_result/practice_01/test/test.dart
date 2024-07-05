import 'package:learn_dart_together/20_result/practice_01/calculator.dart';
import 'package:learn_dart_together/20_result/practice_01/core/result.dart';
import 'package:test/test.dart';

void main() {
  test('calculator 나눗셈을 0으로 나눌경우 에러 처리', () {
    //준비
    Calculator calculator = Calculator();
    var result = calculator.divide(3, 0);
    //검증
    expect(result, isA<Result<double>>());
    // expect 함수를 사용하여 result가 Result<double> 타입인지 확인
    // isA<T>()는 객체가 타입 T의 인스턴스인지 확인하는 매처이다
    result.when(
        success: (_) => fail('0으로 나눌 때 성공 결과가 반환되면 안됩니다'),
        error: (error) {
          expect(error, isA<Exception>());
          expect(error.toString(), contains('값을 0으로 나눌 수 없습니다.'));
        });
    // result.when은 Result 클래스의 분기 처리 메서드로, 성공(success)과 에러(error)의 경우를 처리
    // success의 경우, 나누기 0으로 성공 결과가 반환되면 안 되므로 fail 함수를 호출하여 테스트를 실패로 처리
    // error의 경우, error가 Exception 타입인지 확인하고,
    // 에러 메시지에 '값을 0으로 나눌 수 없습니다.'가 포함되어 있는지 확인
  });
}
