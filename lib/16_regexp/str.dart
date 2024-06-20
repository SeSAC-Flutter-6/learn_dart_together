void main() {
  String str = makeStr();
  List<String> numString = str.split(RegExp(r'[,]'));
  print(numString);
}

String makeStr() {
  String str = '';
  for (int i = 1; i <= 100; i++) {
    str = '$str$i,';
  }
  return str;
}
