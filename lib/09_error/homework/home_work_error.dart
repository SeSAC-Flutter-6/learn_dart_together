void main() {
  final numString = '10.5';
  int num = int.tryParse(numString) ?? 0;
  print(num);
}
