void main() {
  final numString = '10.5';
  int num;
  try {
    num = int.parse(numString);
  } catch (e) {
    print('${e}0으로 처리함');
    num = 0;
  }
  print(num);
}
