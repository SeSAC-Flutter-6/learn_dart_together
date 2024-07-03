final class Product {
  final int id;
  final String name;
  final int price;
  final int stock;

//<editor-fold desc="Data Methods">
  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          price == other.price &&
          stock == other.stock);

  @override
  int get hashCode =>
      id.hashCode;

  @override
  String toString() {
    return 'Product{' +
        ' id: $id,' +
        ' name: $name,' +
        ' price: $price,' +
        ' stock: $stock,' +
        '}';
  }

  Product copyWith({
    int? id,
    String? name,
    int? price,
    int? stock,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'stock': this.stock,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      stock: map['stock'] as int,
    );
  }

//</editor-fold>
}