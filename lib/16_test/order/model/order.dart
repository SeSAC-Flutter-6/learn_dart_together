import 'package:collection/collection.dart';
import 'package:learn_dart_together/16_test/order/model/order_item.dart';

class Order {
  final int id;
  final int userId;
  final String status;
  final String createdAt;
  List<OrderItem> orderItems;

  Order({
    required this.id,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.orderItems,
  });

  Order copyWith({
    int? id,
    int? userId,
    String? status,
    String? createdAt,
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
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'status': status,
      'createdAt': createdAt,
      'orderItems': orderItems.map((x) => x.toJson()).toList(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int,
      userId: json['userId'] as int,
      status: json['status'] as String,
      createdAt: json['createdAt'] as String,
      orderItems: List<OrderItem>.from(
        (json['orderItems'] as List<int>).map<OrderItem>(
          (x) => OrderItem.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, status: $status, createdAt: $createdAt, orderItems: $orderItems)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.userId == userId &&
        other.status == status &&
        other.createdAt == createdAt &&
        listEquals(other.orderItems, orderItems);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        status.hashCode ^
        createdAt.hashCode ^
        orderItems.hashCode;
  }
}
