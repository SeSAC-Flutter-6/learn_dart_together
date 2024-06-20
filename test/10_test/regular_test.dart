import 'package:learn_dart_together/10_debug_lambda_regular/regular.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('1번', () {
    String oneToHundred = '';
    List.generate(100, (index) => index + 1).forEach((e) {
      oneToHundred += '$e,';
    });
    List<String> numString = oneToHundred.split(',');

    expect(oneToHundred,
        '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,');

    for (int i = 0; i < numString.length; i++) {
      if (i != numString.length - 1) expect(numString[i], (i + 1).toString());
    }
  });

  test('2번', () {
    String path = 'C:\\dev';
    String path2 = 'C:\\dev\\';
    String fileName = 'abc.txt';

    expect(getPath(path, fileName), 'C:\\dev\\abc.txt');
    expect(getPath(path2, fileName), 'C:\\dev\\abc.txt');
  });

  group('3번', () {
    test('3-1번', () {
      final one = RegExp(r'.*');
      final test1 = '';
      var test2 = '';
      for (int i = 0; i < 100; i++) test2 += ' ';

      expect(one.hasMatch(test1), true);
      expect(one.hasMatch(test2), true);
    });

    test('3-2번', () {
      final two = RegExp(r'^(A[0-9][0-9]?)$');

      final test1 = 'B3';
      final test2 = 'AA';
      final test3 = 'A3';
      final test4 = 'A33';
      final test5 = 'A3@';
      final test6 = 'A3E';
      final test7 = 'A3GG';

      expect(two.hasMatch(test1), false);
      expect(two.hasMatch(test2), false);
      expect(two.hasMatch(test3), true);
      expect(two.hasMatch(test4), true);
      expect(two.hasMatch(test5), false);
      expect(two.hasMatch(test6), false);
      expect(two.hasMatch(test7), false);
    });

    test('3-3번', () {
      final three = RegExp(r'^(U[A-Z][A-Z][A-Z])$');

      final test1 = 'U';
      final test2 = 'AU';
      final test3 = 'UABD';
      final test4 = 'UABAB';
      final test5 = 'U3AB';
      final test6 = 'UAB3';

      expect(three.hasMatch(test1), false);
      expect(three.hasMatch(test2), false);
      expect(three.hasMatch(test3), true);
      expect(three.hasMatch(test4), false);
      expect(three.hasMatch(test5), false);
      expect(three.hasMatch(test6), false);

    });
  });


}
