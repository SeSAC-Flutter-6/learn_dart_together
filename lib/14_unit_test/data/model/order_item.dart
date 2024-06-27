class OrderItem {
  final int id;
  final int productId;
  final int quantity;
  final int price;

  OrderItem({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
  });

  OrderItem copyWith({
    int? id,
    int? productId,
    int? quantity,
    int? price,
  }) {
    return OrderItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'price': price,
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as int,
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
      price: json['price'] as int,
    );
  }

  @override
  String toString() {
    return 'OrderItem(id: $id, productId: $productId, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(covariant OrderItem other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.productId == productId &&
        other.quantity == quantity &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        productId.hashCode ^
        quantity.hashCode ^
        price.hashCode;
  }
}
