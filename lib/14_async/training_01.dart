// sample.csv 파일을 읽어와서 “한석봉" 이라는 문자열이 있는지 찾고,
// 있다면 sample_copy.csv 파일에 “김석봉"으로 수정하는 함수를 작성하시오.
// (async - await 사용할 것)
import 'dart:async';
import 'dart:io';

Future<void> main() async {
  Future<void> read(String source) async {
    //파일 열기
    final file = File(source);
    String text = await file.readAsString(); //readAsString : futureString 타입
    text = text.replaceAll('한석봉', '김석봉');
    print(text);
  }


  //원본 수정 문자열 수정 메서드.. replaceAll

  read('lib/14_async/sample.csv');
}
