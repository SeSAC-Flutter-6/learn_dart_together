import 'package:test/test.dart';
import 'package:learn_dart_together/08_generic&enum&string/practice_1/strongbox.dart';
import 'package:learn_dart_together/08_generic&enum&string/practice_1/keytype.dart';
import 'package:learn_dart_together/08_generic&enum&string/practice_1/constants.dart';

void main() {
  late StrongBox strongboxPadlock;
  late StrongBox strongboxButton;
  late StrongBox strongboxDial;
  late StrongBox strongboxFinger;
  group('StrongBox 클래스 테스트', () {
    setUp(() {
      strongboxPadlock = StrongBox(keytype: Keytype.padlock);
      strongboxButton = StrongBox(keytype: Keytype.button);
      strongboxDial = StrongBox(keytype: Keytype.dial);
      strongboxFinger = StrongBox(keytype: Keytype.finger);
    });
    test('strongbox에는 어떤 type의 object든 넣을 수 있다', () {
      strongboxPadlock.put('Padlock');
      for (var i = 0; i < padlockMaxCount + 1; i++) {
        strongboxPadlock.get();
      }
      expect(strongboxPadlock.get(), equals('Padlock'));

      strongboxPadlock.put(1);
      for (var i = 0; i < padlockMaxCount + 1; i++) {
        strongboxPadlock.get();
      }
      expect(strongboxPadlock.get(), equals(1));

      strongboxPadlock.put(1.0);
      for (var i = 0; i < padlockMaxCount + 1; i++) {
        strongboxPadlock.get();
      }
      expect(strongboxPadlock.get(), equals(1.0));
      for (var i = 0; i < padlockMaxCount + 1; i++) {
        strongboxPadlock.get();
      }
      strongboxPadlock.put(true);
      expect(strongboxPadlock.get(), equals(true));

      for (var i = 0; i < padlockMaxCount + 1; i++) {
        strongboxPadlock.get();
      }
      strongboxPadlock.put([1, 2, 3]);
      expect(strongboxPadlock.get(), equals([1, 2, 3]));
    });
    test('put() 메서드 실행시, 각 열쇠의 시도횟수의 한도를 초과한 상태라면 상자에 넣은 것을 return한다', () {
      strongboxPadlock.put('Padlock');
      strongboxButton.put('Button');
      strongboxDial.put('Dial');
      strongboxFinger.put('Finger');

      for (var i = 0; i < padlockMaxCount + 1; i++) {
        strongboxPadlock.get();
      }
      for (var i = 0; i < buttonMaxCount + 1; i++) {
        strongboxButton.get();
      }
      for (var i = 0; i < dialMaxCount + 1; i++) {
        strongboxDial.get();
      }
      for (var i = 0; i < fingerMaxCount + 1; i++) {
        strongboxFinger.get();
      }
      expect(strongboxPadlock.get(), equals('Padlock'));
      expect(strongboxButton.get(), equals('Button'));
      expect(strongboxDial.get(), equals('Dial'));
      expect(strongboxFinger.get(), equals('Finger'));
    });

    test('put() 메서드 실행시, 각 열쇠의 시도횟수의 한도에 도달하면 상자에 넣은 것을 return한다', () {
      strongboxPadlock.put('Padlock');
      strongboxButton.put('Button');
      strongboxDial.put('Dial');
      strongboxFinger.put('Finger');

      for (var i = 0; i < padlockMaxCount; i++) {
        strongboxPadlock.get();
      }
      for (var i = 0; i < buttonMaxCount; i++) {
        strongboxButton.get();
      }
      for (var i = 0; i < dialMaxCount; i++) {
        strongboxDial.get();
      }
      for (var i = 0; i < fingerMaxCount; i++) {
        strongboxFinger.get();
      }
      expect(strongboxPadlock.get(), equals('Padlock'));
      expect(strongboxButton.get(), equals('Button'));
      expect(strongboxDial.get(), equals('Dial'));
      expect(strongboxFinger.get(), equals('Finger'));
    });

    test('put() 메서드 실행시, 각 열쇠의 시도횟수의 한도에 도달하지 않은 상태라면 null을 return한다', () {
      strongboxPadlock.put('Padlock');
      strongboxButton.put('Button');
      strongboxDial.put('Dial');
      strongboxFinger.put('Finger');

      for (var i = 0; i < padlockMaxCount - 1; i++) {
        strongboxPadlock.get();
      }
      for (var i = 0; i < buttonMaxCount - 1; i++) {
        strongboxButton.get();
      }
      for (var i = 0; i < dialMaxCount - 1; i++) {
        strongboxDial.get();
      }
      for (var i = 0; i < fingerMaxCount - 1; i++) {
        strongboxFinger.get();
      }
      expect(strongboxPadlock.get(), isNull);
      expect(strongboxButton.get(), isNull);
      expect(strongboxDial.get(), isNull);
      expect(strongboxFinger.get(), isNull);
    });
  });
}
