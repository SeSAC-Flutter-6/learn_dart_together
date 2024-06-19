void main() {
  final numString = '10.5';
  int num = 0;
  try {
    num = int.parse(numString);
  } catch (e) {
    print(e);
  } finally {
    print(num);
  }
}
