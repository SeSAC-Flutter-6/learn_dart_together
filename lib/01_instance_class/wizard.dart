import 'package:learn_dart_together/01_instance_class/wand.dart';

//문제 1 에서 작성한 Wand 클래스와 Wizard 클래스에 대해, 아래의 4가지 규칙에 따라 타당성 검사 또는 적절한 에러 처리를 추가하시오.
//부정한 값이 설정 될 경우에는 “Exception(“에러메세지");” 를 작성하여 프로그램을 중단 시킵니다.
//
//마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
//지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
//마법사 생성 이후에 마법사의 지팡이에 null을 설정할 수 없다. - setter Exception 설정
//(마법사는 한번 지팡이를 들면 내려놓을 수 없음)
//마법사의 MP는 0 이상이어야 한다.
//HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다

class Wizard {
  String _name = '';
  int _mp;
  int _hp;
  Wand? _wand; //지팡이를 들 수 있다 nullable

  String get name => _name;
  int get mp => _mp;
  int get hp => _hp;
  Wand? get wand => _wand;

  //생성자에 바로 if문을 걸면 생성할때 체크 할 수 있다
  Wizard({
    required String name,
    required int mp,
    required int hp,
    Wand? wand,
  })  : _name = name,
        _mp = mp,
        _hp = hp,
        _wand = wand {
    if (name.isEmpty || name.length < 3) {
      throw Exception('마법사 이름이 없거나 3문자 이상이 아닙니다.');
    }

    if (mp < 0 || mp > 100) {
      throw Exception('mp는 1이상 100이하가 되야합니다.');
    }
  }

  //setter를 이용해 수정시에도 에러체크를 할 수 있다
  set name(String value) {
    if (name.isEmpty || name.length < 3) {
      throw Exception('마법사 이름이 없거나 3문자 이상이 아닙니다.');
    }

    if (mp < 0) {
      throw Exception('mp는 0이 될수 없습니다.');
    }
    _name = value;
  }

// setter를 이용한 hp 마이너스 처리 코드
  set hp(int value) {
    if (value < 0) {
      _hp = 0;
      throw Exception('hp는 마이너스가 되지 못합니다. 0으로 돌아갑니다.');
    }
    _hp = value;
  }

//wand를 가질 수 있었지만(nullable) 생성 후에는 (non-nullable) null 허용 금지
  set wand(Wand? value) {
    if (value == null) {
      throw Exception('마법사는 지팡이를 한번 들면 가지고 있어야합니다.');
    }
    _wand = value;
  }

  void die() {
    print('$name이 사망했습니다.');
  }
}
