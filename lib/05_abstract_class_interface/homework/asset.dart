abstract class Asset { //'가' class
  String name;
  int price;
  bool isRare; //희소성 여부

  Asset({
    required this.name,
    required this.price,
    required this.isRare,
  });

  void checkAssetType(); //유형,무형 체크
}
