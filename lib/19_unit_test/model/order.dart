import 'package:collection/collection.dart';

import 'package:learn_dart_together/19_unit_test/model/order_item.dart';

class Order {
  final int id;
  final int userId;
  final String status;
  final String createdAt;
  final List<OrderItem> orderItems; // <-- 이 부분을 OrderItem 타입으로 명시적으로 지정

  Order({
    required this.id,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.orderItems,
  });

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        userId = json['userId'] as int,
        status = json['status'] as String,
        createdAt = json['createdAt'] as String,
        orderItems = (json['orderItems']
                as List<dynamic>) // <-- List<dynamic> 대신 List<OrderItem>으로 변경
            .map((itemJson) => OrderItem.fromJson(
                itemJson as Map<String, dynamic>)) // OrderItem으로 명시적으로 캐스팅
            .toList();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status,
      'createdAt': createdAt,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }

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

  @override
  String toString() {
    return 'Order(id: $id, userId: $userId, status: $status, createdAt: $createdAt, orderItems: $orderItems)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Order &&
        other.id == id &&
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
