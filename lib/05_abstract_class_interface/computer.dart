
//TangibleAsset를 상속받은 Computer 클래스
import 'package:learn_dart_together/05_abstract_class_interface/tangible_asset.dart';

class Computer extends TangibleAsset {
  String makerName;

  Computer({
    required super.id,
    required super.price,
    required super.name,
    required super.color,
    required super.weight,
    required this.makerName,
  });

  //게터 재정의
  // @override
  // double get weight => _weight;

  //세터 재정의
  // @override
  // set weight(double newValue) {
  //   _weight = newValue;
  // }
}