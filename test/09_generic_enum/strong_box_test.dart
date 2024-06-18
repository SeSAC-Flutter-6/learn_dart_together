import 'package:learn_dart_together/09_generic_enum/strong_box.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('keyType = padlock', () {
    StrongBox<String> strongBox = StrongBox(keyType: KeyType.padlock);
    strongBox.put('present');
    test('1024번 get 하면 present return', () {
      for (int i = 0; i < 1023; i++) {
        expect(strongBox.get(), null);
      }
      expect(strongBox.get(), 'present'); //1024번째
    });
  });
  group('keyType = button', () {
    StrongBox<String> strongBox = StrongBox(keyType: KeyType.button);
    strongBox.put('present');
    test('10000번 get 하면 present return', () {
      for (int i = 0; i < 9999; i++) {
        expect(strongBox.get(), null);
      }
      expect(strongBox.get(), 'present'); //10000번째
    });
  });
  group('keyType = dial', () {
    StrongBox<String> strongBox = StrongBox(keyType: KeyType.dial);
    strongBox.put('present');
    test('30000번 get 하면 present return', () {
      for (int i = 0; i < 29999; i++) {
        expect(strongBox.get(), null);
      }
      expect(strongBox.get(), 'present'); //30000번째
    });
  });
  group('keyType = finger', () {
    StrongBox<String> strongBox = StrongBox(keyType: KeyType.finger);
    strongBox.put('present');
    test('1000000번 get 하면 present return', () {
      for (int i = 0; i < 999999; i++) {
        expect(strongBox.get(), null);
      }
      expect(strongBox.get(), 'present'); //1000000번째
    });
  });
}
