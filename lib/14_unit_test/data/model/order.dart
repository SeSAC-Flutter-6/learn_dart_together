import 'package:collection/collection.dart';
import 'package:learn_dart_together/14_unit_test/data/model/order_item.dart';

class Order {
  final int id;
  final String userId;
  final OrderStatus status;
  final DateTime createdAt;
  final List<OrderItem> orderItems;

  Order({
    required this.id,
    required this.userId,
    required this.status,
    required this.createdAt,
    required this.orderItems,
  });

  Order copyWith({
    int? id,
    String? userId,
    OrderStatus? status,
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
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'orderItems': orderItems.map((e) => e.toJson()).toList(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int,
      userId: json['userId'] as String,
      status: _parseStatus(json['status'] as String), // enum 값으로 변환
      createdAt: DateTime.parse(json['createdAt'] as String),
      orderItems: (json['orderItems'] as List<Map<String, dynamic>>)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
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

  // Helper method to parse string status to enum
  static OrderStatus _parseStatus(String status) {
    switch (status) {
      case '대기':
        return OrderStatus.pending;
      case '처리중':
        return OrderStatus.processing;
      case '완료':
        return OrderStatus.completed;
      default:
        throw ArgumentError('Unknown status: $status');
    }
  }
}

enum OrderStatus {
  pending,
  processing,
  completed,
}
