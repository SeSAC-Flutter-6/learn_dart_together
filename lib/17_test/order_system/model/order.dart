import 'order_item.dart';

class Order {
  final int id;
  final int userId;
  final String status;
  final DateTime createdAt;
  final List<OrderItem> orderItems;

//<editor-fold desc="Data Methods">
  Order({
    required this.id,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.orderItems,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          status == other.status &&
          createdAt == other.createdAt &&
          orderItems == other.orderItems);

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      status.hashCode ^
      createdAt.hashCode ^
      orderItems.hashCode;

  @override
  String toString() {
    return 'Order{ id: $id, userId: $userId, status: $status, createdAt: $createdAt, orderItems: $orderItems,}';
  }

  Order copyWith({
    int? id,
    int? userId,
    String? status,
    DateTime? createdAt,
    List<OrderItem>? orderItems,
  }) {
    return Order(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      orderItems: orderItems ?? this.orderItems,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status,
      'createdAt': createdAt.toString(),
      'orderItems': orderItems.map((e) => e.toJson()).toList(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int,
      userId: json['userId'] as int,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt']),
      orderItems: (json['orderItems'] as List<dynamic>)
          .map((item) => OrderItem.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

//</editor-fold>
}
