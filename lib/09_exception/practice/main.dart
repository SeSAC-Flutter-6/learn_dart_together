import 'format_exception.dart';

void main() {
  int result;
  final numString = '10.5';

  try {
    result = int.parse(numString);
    print('$result is int');
  } catch (e) {
    // throw FormatException('Cannot parse $numString to int');
    result = 0;
    print('$result is not int');
  } finally {
    print('무조건 실행된다.');
  }
}
