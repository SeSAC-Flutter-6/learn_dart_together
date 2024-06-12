import 'package:learn_dart_together/05_abstract_class_interface/asset.dart';

abstract class IntangibleAsset extends Asset {
  IntangibleAssetType type;
  IntangibleAsset({
    required super.name,
    required super.price,
    required this.type,
  });
}

enum IntangibleAssetType {
  goodwill, // 영업권
  industrialProperty, // 산업재산권
  developmentCosts, // 개발비
  license, // 라이선스
  franchise, // 프랜차이즈
  copyright, // 저작권
  software, // 컴퓨터 소프트웨어
  leaseRights, // 임차 권리금
}
