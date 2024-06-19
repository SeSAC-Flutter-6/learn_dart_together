void main() {
  List<String> numsString = [];
  String str = '';
  int temp = 0;

  for (var i = 1; i <= 100; i++) {
    temp = i;
    str += '$temp,';
  }
  print(str);

  numsString = str.split(',');
  print(numsString);
}
