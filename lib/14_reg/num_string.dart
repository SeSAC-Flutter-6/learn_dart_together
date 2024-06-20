import 'package:collection/collection.dart';

void main() {
  String str = '';
  for (int i = 1; i <= 100; i++) {
    str += '$i,';
  }
  List<String> numsString = str.split(',').slice(0, -1);
}
