import 'package:learn_dart_together/08_Generic_Enum/strong_box.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  int specialThing = 1;
  group('Strong Box Test', () {
    test('금고 잠금해제 횟수 > 열쇠 최소 시도 횟수 ? null : data', () {
      StrongBox<int> strongBox1 = StrongBox(keyType: KeyType.padlock);
      StrongBox<int> strongBox2 = StrongBox(keyType: KeyType.button);
      StrongBox<int> strongBox3 = StrongBox(keyType: KeyType.dial);
      StrongBox<int> strongBox4 = StrongBox(keyType: KeyType.finger);

      strongBox1.put(specialThing);
      strongBox2.put(specialThing);
      strongBox3.put(specialThing);
      strongBox4.put(specialThing);

      List<StrongBox> boxs = [strongBox1, strongBox2, strongBox3, strongBox4];
      boxs.forEach((box) {
        late int? data;
        for(int i = 1; i < box.keyType.limit; i++) {
          data = box.get();
          expect(data, null);
        }
        data = box.get();
        expect(data, specialThing);
      });
    });
  });
}