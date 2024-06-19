void main() {
  // 연습문제 1)
  final sb = StringBuffer();
  for (int i = 0; i < 100; i++) {
    sb.write('$i,');
  }

  final str = sb.toString();
  final numsString = str.split(RegExp(r'[,]'));
  print(numsString);

  // 연습문제 2)
  String getPath(String path, String fileName) {
    if (!RegExp(r'\\$').hasMatch(path)) {
      path = '$path\\';
    }
    return '$path$fileName';
  }

  print(getPath('C:\\dev', 'abc.txt'));

  // 연습문제 3)
  // 3-1) .*
  // 3-2) ^A\d\d?
  // 3-3) ^U[A-Z]{3}
}
