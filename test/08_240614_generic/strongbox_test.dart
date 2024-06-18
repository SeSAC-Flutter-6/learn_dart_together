import 'package:test/test.dart';
import 'package:learn_dart_together/08_240614_generic/strongbox.dart';

void main() {
  group('StrongBox Keytype 별로 test 해보기', () {
    test('StrongBox가 keyType이 padlock일 경우 잠금횟수 test-1024미만 null, 1024때 data 리턴',
        () {
      StrongBox<String> padlock1 = StrongBox<String>(KeyType.padlock);

      for (int i = 0; i < 1024; i++) {
        expect(padlock1.get(), null);
      }

      padlock1.put("padlock Data");
      expect(padlock1.get(), "padlock Data");
    });
  });
  test('StrongBox가 keyType이 button일 경우 잠금횟수 test-10000 null', () {
    StrongBox<String> button1 = StrongBox<String>(KeyType.button);

    for (int i = 0; i < 10000; i++) {
      expect(button1.get(), null);
    }
    button1.put('button1 Data');
    expect(button1.get(), 'button1 Data');
  });

  test('StrongBox가 keyType이 dial일 경우 잠금횟수 test-10000 null', () {
    StrongBox<String> dial1 = StrongBox<String>(KeyType.dial);

    for (int i = 0; i < 30000; i++) {
      expect(dial1.get(), null);
    }
    dial1.put('dial1 Data');
    expect(dial1.get(), 'dial1 Data');
  });

  test('StrongBox가 keyType이 finger일 경우 잠금횟수 test-10000 null', () {
    StrongBox<String> finger1 = StrongBox<String>(KeyType.finger);

    for (int i = 0; i < 1000000; i++) {
      expect(finger1.get(), null);
    }
    finger1.put('dial1 Data');
    expect(finger1.get(), 'dial1 Data');
  });
}
