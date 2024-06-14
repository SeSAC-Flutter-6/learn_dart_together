import 'intangible_asset.dart';

class Software extends IntangibleAsset {
  String version;
  String lincenseType;
  int licenseNumber;

  Software({
    required this.version,
    required this.lincenseType,
    required this.licenseNumber,
    required super.name,
    required super.price,
    required super.description,
    required super.registrationDate,
  });

  @override
  void rent(int piece, int days) {
    print('소프트웨어 라이센스 $piece개를 $days간 대여합니다');
  }
}
