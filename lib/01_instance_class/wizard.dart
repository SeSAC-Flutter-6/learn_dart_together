import 'package:learn_dart_together/01_instance_class/wand.dart';

//문제 1 에서 작성한 Wand 클래스와 Wizard 클래스에 대해, 아래의 4가지 규칙에 따라 타당성 검사 또는 적절한 에러 처리를 추가하시오.
//부정한 값이 설정 될 경우에는 “Exception(“에러메세지");” 를 작성하여 프로그램을 중단 시킵니다.

//마법사나 지팡이의 이름은 null 일 수 없고, 반드시 3문자 이상이어야 한다
//지팡이의 마력은 0.5 이상 100.0 이하여야 한다.
//마법사 생성 이후에 마법사의 지팡이에 null을 설정할 수 없다.
//(마법사는 한번 지팡이를 들면 내려놓을 수 없음)
//마법사의 MP는 0 이상이어야 한다.
//HP가 음수가 되는 상황에서는 대신 0을 설정 되도록 한다

class Wizard {
  String _name = '';
  int hp;
  Wand? wand; //지팡이를 들 수 있다 nullable

  String get name => _name;

  //생성자에 바로 if문을 걸면 생성할때 체크 할 수 있다
  Wizard({
    required String name,
    required this.hp,
    this.wand,
  }) : _name = name {
    if (name.isEmpty) {
      throw Exception('이름이 꼭 있어야합니다.');
    }

    if (name.length < 3) {
      throw Exception('이름은 3문자 이상이어야 합니다.');
    }
  }


  set name(String value) {
    if (value.isEmpty) {
      throw Exception('이름이 꼭 있어야합니다.');
    }

    if (value.length < 3) {
      throw Exception('이름은 3문자 이상이어야 합니다.');
    }
    _name = value;
  }
}
