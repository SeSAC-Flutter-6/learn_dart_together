import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/test.dart';
import 'package:test/expect.dart';

void main() {
  test('selfAid test: mp >= 5', () {
    final cleric = Cleric('성직자', 20, 10);

    cleric.selfAid();

    expect(cleric.hp, 50);
    expect(cleric.mp, 5);
  });

  test('selfAid test: mp < 5', () {
    final cleric = Cleric('성직자', 20, 3);

    cleric.selfAid();

    expect(cleric.hp, 20);
    expect(cleric.mp, 3);
  });

  test('pray test', () {
    final cleric = Cleric('성직자', 50, 2);

    final result = cleric.pray(seconds: 3);

    expect(result, lessThanOrEqualTo(5));
    expect(result, greaterThanOrEqualTo(3));
  });

  test('pray test: mp = maxMp', () {
    final cleric = Cleric('성직자', 50, 10);

    final result = cleric.pray(seconds: 3);

    expect(result, 0);
  });
}
