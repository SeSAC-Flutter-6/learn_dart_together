void main() {
  final String numStr = '5.5';
  late int num;
  try {
    num = int.parse(numStr);
  } catch(e) {
    num = 0;
  } finally {
    print('num: $num');
  }
}