void main() {
  String string = 'hello';

  Object object = '111';
  object = 11;
  object = Hero();  //다형성 때문에 다 대입이 됨

  if(object is int){

  }
  // Hero hero1 = Hero(name :'name', hp: 100);
  // Hero hero2 = Hero(name :'name', hp: 100);
  //
  // print(hero1 == hero2);
}

class Hero extends Object {
}

