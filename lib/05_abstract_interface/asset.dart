abstract class Asset {
  String name;
  int price;

  Asset({
    required this.name,
    required this.price,
  });

  void display() {
    print('Asset: $name, price: $price');
  }
}