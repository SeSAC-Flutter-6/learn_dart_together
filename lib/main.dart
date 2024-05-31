
import 'package:learn_dart_together/01_instance_class/hero.dart';
import 'package:learn_dart_together/01_instance_class/slime.dart';

void main(List<String> arguments) {
  // 가상세계에 용사를 생성
  // 용사는 이름과 hp를 반드시 가져야함
  Hero hero = Hero('아리', 100);

  Slime slime1 = Slime(50, '슬라임A');
  Slime slime2 = Slime(40, '슬라임B');

  hero.attack();
  hero.run();
  hero.sleep();
  slime1.run();
  slime2.run();

}
