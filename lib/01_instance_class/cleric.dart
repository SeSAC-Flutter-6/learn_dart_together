import 'dart:math';

void main() {
  // Cleric cleric = Cleric(name: '성직자', hp: 50, mp: 10);
}

class Cleric {
  String name;
  int hp;
  final int maxHp = 50;
  int mp;
  final int maxMp = 10;


  // 생성자
  Cleric({
    required this.name,
    required this.hp,
    required this.mp,
  });

  void selfAid(){
    try{
      if(mp >= 5){
        mp -= 5;
        hp = maxHp;
        print('mp -5 maxHp 회복˙ᵕ˙ 현재 MP: $mp HP: $hp ');
      }else{
        print("mp가 5 미만! -5 불가 mp 회복 후 다시「(°ヘ°) 현재 MP: $mp HP: $hp");
      }
    } catch (e) {
      print('selfAid 에서 예외 발생: $e');
    }
  }

  int pray(int second) {
     try{
       int recoveredMp = Random().nextInt(3) + second;
       int realRecoveredMp = recoveredMp + mp > maxMp ? maxMp - mp : recoveredMp;
       mp += realRecoveredMp;
       print("mp +$realRecoveredMp 회복되었어요˘ᵕ˘ 현재 MP: $mp HP: $hp");
       return realRecoveredMp;
     } catch (e) {
       print('pray 에서 예외 발생: $e');
       return -1;
     }
  }


}
