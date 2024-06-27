import 'dart:convert';

class OrderItem {
  final int id;
  final int productId;
  final int quantity;
  final double price;

  OrderItem({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as int,
      productId: json['productId'] as int,
      quantity: json['quantity'] as int,
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'price': price,
    };
  }

  @override
  String toString() {
    return 'OrderItem(id: $id, productId: $productId, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrderItem &&
        other.id == id &&
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
