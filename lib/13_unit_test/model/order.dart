import 'package:learn_dart_together/13_unit_test/model/order_item.dart';

final class Order {
  final int id;
  final int userId;
  final String status;
  final String createdAt;
  final List<OrderItem> orderItems;

//<editor-fold desc="Data Methods">
  const Order({
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
    return 'Order{' +
        ' id: $id,' +
        ' userId: $userId,' +
        ' status: $status,' +
        ' createdAt: $createdAt,' +
        ' orderItems: $orderItems,' +
        '}';
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

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'userId': this.userId,
      'status': this.status,
      'createdAt': this.createdAt,
      'orderItems': this.orderItems,
    };
  }

  factory Order.fromJson(Map<String, dynamic> map) {
    return Order(
      id: map['id'] as int,
      userId: map['userId'] as int,
      status: map['status'] as String,
      createdAt: map['createdAt'] as String,
      orderItems: map['orderItems'] as List<OrderItem>,
    );
  }

//</editor-fold>
}

enum OrderStatus {
  pending, // 대기 중
  processing, // 처리 중
  completed, // 완료됨
  cancelled, // 취소됨
  refunded // 환불됨
}

extension OrderStatusExtension on OrderStatus {
  String get value {
    switch (this) {
      case OrderStatus.pending:
        return 'pending';
      case OrderStatus.processing:
        return 'processing';
      case OrderStatus.completed:
        return 'completed';
      case OrderStatus.cancelled:
        return 'cancelled';
      case OrderStatus.refunded:
        return 'refunded';
      default:
        return '';
    }
  }

  static OrderStatus fromString(String status) {
    switch (status) {
      case 'pending':
        return OrderStatus.pending;
      case 'processing':
        return OrderStatus.processing;
      case 'completed':
        return OrderStatus.completed;
      case 'cancelled':
        return OrderStatus.cancelled;
      case 'refunded':
        return OrderStatus.refunded;
      default:
        throw ArgumentError('Invalid order status: $status');
    }
  }
}