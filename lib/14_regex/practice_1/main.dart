void main() {
  List<String> numsString = [];
  String str = [for (int i = 1; i <= 100; i++) '$i'].join(',');
  str = str.replaceAllMapped(RegExp(r'$'), (match) => ',');
  numsString = str.split(',');
  print(numsString);
}
