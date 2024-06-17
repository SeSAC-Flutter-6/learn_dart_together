import 'package:learn_dart_together/08_generic/strong_box.dart';
import 'package:test/test.dart';

void main() {
  group('StrongBox put() test', () {
    test('1: padloc', () {
      final padlockBox = StrongBox<int>(keyType: KeyType.padlock);
      int padlockItem = 10000;
      padlockBox.put(padlockItem);
      expect(padlockBox.get(), padlockItem);
    });
    test('2: button', () {
      final buttonBox = StrongBox<String>(keyType: KeyType.button);
      String buttonItem = '금괴';
      buttonBox.put(buttonItem);
      expect(buttonBox.get(), buttonItem);
    });

    test('3: dial', () {
      final dialBox = StrongBox<double>(keyType: KeyType.dial);
      double dialItem = 3.14;
      dialBox.put(dialItem);
      expect(dialBox.get(), dialItem);
    });

    test('4: finger', () {
      final fingerBox = StrongBox<bool>(keyType: KeyType.finger);
      bool fingerItem = true;
      fingerBox.put(fingerItem);
      expect(fingerBox.get(), fingerItem);
    });
  });

  group('StrongBox get() test', () {
    final String item = 'treasure';
    test('1: padlock', () {
      final padlockBox =
          StrongBox<String>(keyType: KeyType.padlock, item: item);
      for (int i = 0; i < KeyType.padlock.maxAttempts; i++) {
        expect(padlockBox.get(), item);
      }
      expect(padlockBox.get(), null);
    });

    test('2: button', () {
      final buttonBox = StrongBox<String>(keyType: KeyType.button, item: item);
      for (int i = 0; i < KeyType.button.maxAttempts; i++) {
        expect(buttonBox.get(), item);
      }
      expect(buttonBox.get(), null);
    });

    test('3: dial', () {
      final dialBox = StrongBox<String>(keyType: KeyType.dial, item: item);
      for (int i = 0; i < KeyType.dial.maxAttempts; i++) {
        expect(dialBox.get(), item);
      }
      expect(dialBox.get(), null);
    });

    test('4: finger', () {
      final fingerBox = StrongBox<String>(keyType: KeyType.finger, item: item);
      for (int i = 0; i < KeyType.finger.maxAttempts; i++) {
        expect(fingerBox.get(), item);
      }
      expect(fingerBox.get(), null);
    });
  });
}
