// in_memory_order_data_source_impl.dart

import 'package:learn_dart_together/19_unit_test/data_source/order_data_source.dart';
import 'package:learn_dart_together/19_unit_test/model/order.dart';
import 'package:learn_dart_together/19_unit_test/model/order_item.dart';

class InMemoryOrderDataSourceImpl implements OrderDataSource {
  final Map<int, Order> _orders = {};
  int _nextOrderId = 1;

  @override
  Future<void> createOrder(Order order) async {
    _orders[order.id] = order.copyWith(id: _nextOrderId++);
  }

  @override
  Future<Order?> getOrder(int orderId) async {
    return _orders[orderId];
  }

  @override
  Future<void> updateOrderStatus(int orderId, String newStatus) async {
    if (_orders.containsKey(orderId)) {
      _orders[orderId] = _orders[orderId]!.copyWith(status: newStatus);
    }
  }

  @override
  Future<void> cancelOrder(int orderId) async {
    _orders.remove(orderId);
  }

  @override
  Future<List<Order>> getOrdersByUser(int userId) async {
    return _orders.values.where((order) => order.userId == userId).toList();
  }

  @override
  Future<void> addOrderItem(int orderId, OrderItem orderItem) async {
    if (_orders.containsKey(orderId)) {
      final updatedOrder = _orders[orderId]!.copyWith(
        orderItems: [..._orders[orderId]!.orderItems, orderItem],
      );
      _orders[orderId] = updatedOrder;
    }
  }

  @override
  Future<void> removeOrderItem(int orderId, int itemIndex) async {
    if (_orders.containsKey(orderId)) {
      final updatedOrderItems =
          List<OrderItem>.from(_orders[orderId]!.orderItems)
            ..removeAt(itemIndex);
      final updatedOrder =
          _orders[orderId]!.copyWith(orderItems: updatedOrderItems);
      _orders[orderId] = updatedOrder;
    }
  }
}
