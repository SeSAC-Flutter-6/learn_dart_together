abstract class Asset {
  String name;
  int price;

  Asset({
    required this.name,
    required this.price,
  });

  void purchase();
  void sell();
  void rent(int piece, int days);
}
