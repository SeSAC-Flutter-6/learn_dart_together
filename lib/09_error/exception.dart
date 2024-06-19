void stringToInt(String numString) {
  int? num;

  try {
    num = int.parse(numString);
  } catch (e) {
    num = 0;
  } finally {
    print(num);
  }
}
