import 'dart:io';

void main() {
  final file = File('abc.txt');

  file.writeAsStringSync('Hello');
  file.writeAsStringSync('Hello', mode: FlieMode);
  file.writeAsStringSync('Hello');
  file.writeAsStringSync('Hello');
}
Map<String, dynamic> 이랑 똑같이 생긴 Json에서만은 dynamic을 쓴다.
-> object 는 단일파일은 받는데 list, 객체등을 받기 어렵기때문에

컴퓨터 입장에서는 ? xml or json?
-> 컴퓨터가 봐도 json이 좋다

toMap, fromMap 같은것이 인터넷에서 정보를 얻을 수 있지만
toJson / fromJson를 가정하고 라이브러리등을 만들기때문에 이름은 꼭 toJson/fromJson으로 쓰자

named constructor에서는 this에 접근이 안된다.

json은 작은 따옴표 안됨. 쌍따옴표로만 json 으로 인식함

{
  "name" : 'sam',
  "age" : 10,
} --> NG!!!

끝에 쉼표 있으면 안됨 json으로 인식 안함
