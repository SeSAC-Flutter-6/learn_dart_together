import 'package:learn_dart_together/01_instance_class/cleric.dart';
import 'package:test/test.dart';

void main() {
  test('Cleric pray exception test', () {
    final cleric = Cleric(name: 'name');

    // 안 나는 케이스
    expect(() => cleric.pray(praySeconds: 0), returnsNormally);
    expect(() => cleric.pray(praySeconds: 1), returnsNormally);

    // 나는 케이스
    expect(() => cleric.pray(praySeconds: -1), throwsException);
    expect(() => cleric.pray(praySeconds: -2), throwsException);
  });
}