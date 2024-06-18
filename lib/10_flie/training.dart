//원본 파일 경로와 복사할 파일 경로는 프로그램 실행시 파라미터로 전달되는 것으로 하고,
//버퍼링이나 에러 처리는 하지 않는다.
import 'dart:io';
void main() {
  void copy(String source, String target) {
    //파일 열기
    final file = File(source);
    final text = file.readAsStringSync();

    //파일 쓰기
    file.writeAsStringSync(target);
    print(text);
  }
}