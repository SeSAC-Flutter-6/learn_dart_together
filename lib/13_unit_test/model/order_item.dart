final class OrderItem {
  final int id;
  final int productId;
  final int quantity;
  final int price;

//<editor-fold desc="Data Methods">
  const OrderItem({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          productId == other.productId &&
          quantity == other.quantity &&
          price == other.price);

  @override
  int get hashCode =>
      id.hashCode ^ productId.hashCode ^ quantity.hashCode ^ price.hashCode;

  @override
  String toString() {
    return 'Orderitem{' +
        ' id: $id,' +
        ' productId: $productId,' +
        ' quantity: $quantity,' +
        ' price: $price,' +
        '}';
  }

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
    return {
      'id': this.id,
      'productId': this.productId,
      'quantity': this.quantity,
      'price': this.price,
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> map) {
    return OrderItem(
      id: map['id'] as int,
      productId: map['productId'] as int,
      quantity: map['quantity'] as int,
      price: map['price'] as int,
    );
  }

//</editor-fold>
}