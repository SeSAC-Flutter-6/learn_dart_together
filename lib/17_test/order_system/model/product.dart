class Product {
  final int id;
  final String name;
  final int price;
  final int stock;

//<editor-fold desc="Data Methods">
  Product({
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
      id.hashCode ^ name.hashCode ^ price.hashCode ^ stock.hashCode;

  @override
  String toString() {
    return 'Product{ id: $id, name: $name, price: $price, stock: $stock,}';
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
    };
  }

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      stock: json['stock'] as int,
    );
  }

//</editor-fold>
}
