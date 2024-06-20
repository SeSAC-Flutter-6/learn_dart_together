void main() {
  String str = '';
  for (int i = 1; i <= 100; i++) {
    str += '$i,';
  }
  List<String> numString = str.split(',');
  numString.removeLast();
  print(numString);
}
