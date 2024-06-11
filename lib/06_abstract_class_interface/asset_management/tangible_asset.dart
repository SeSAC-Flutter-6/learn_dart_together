import 'package:learn_dart_together/06_abstract_class_interface/asset_management/asset.dart';
import 'package:learn_dart_together/06_abstract_class_interface/asset_management/computer.dart';
import 'package:learn_dart_together/06_abstract_class_interface/asset_management/thing.dart';

abstract class TangibleAsset extends Asset implements Thing {
  String color;

  @override
  double weight;

  TangibleAsset({
    required super.name,
    required super.price,
    required this.weight,
    required this.color,
  });

  void touch(String name);
}

void main() {
  Computer computer = Computer(
      name: 'name',
      price: 1,
      color: 'color',
      weight: 10.0,
      makerName: 'makerName');

  print(computer.weight);
}
