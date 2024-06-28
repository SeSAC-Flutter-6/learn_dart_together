class OrderItem {
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
    return 'OrderItem{ id: $id, productId: $productId, quantity: $quantity, price: $price,}';
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

//</editor-fold>
}