import 'package:learn_dart_together/14_unit_test/order_system/data_source/order_data_source.dart';
import 'package:learn_dart_together/14_unit_test/order_system/data_source/product_data_source.dart';
import 'package:learn_dart_together/14_unit_test/order_system/model/order.dart';
import 'package:learn_dart_together/14_unit_test/order_system/model/order_item.dart';
import 'package:learn_dart_together/14_unit_test/order_system/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource _orderDataSource;
  final ProductDataSource _productDataSource;

  OrderRepositoryImpl(this._orderDataSource, this._productDataSource);

  @override
  Future<void> addOrderItem(Order order, OrderItem orderItem) async {
    final tempOrder = order.copyWith();
    tempOrder.orderItems.add(orderItem);
    await _orderDataSource.updateOrder(tempOrder);
  }

  @override
  Future<int> calculateOrderTotal(Order order) async {
    final sum = order.orderItems.fold(0, (sum, item) => sum + item.price);
    return sum;
  }

  @override
  Future<void> cancelOrder(Order order) async {
    _orderDataSource.updateOrder(order.copyWith(status: 'canceled'));
  } // 재고

  @override
  Future<void> createOrder(Order order) async =>
      _orderDataSource.createOrder(order); // 재고

  @override
  Future<Order?> getOrder(int id) async => _orderDataSource.getOrder(id);

  @override
  Future<List<Order>> getOrdersByUser(int userId) async {
    final getOrders = await _orderDataSource.getOrders();
    return getOrders.where((order) => order.userId == userId).toList();
  }

  @override
  Future<void> removeOrderItem(Order order, OrderItem orderItem) async {
    final tempOrder = order.copyWith();
    tempOrder.orderItems.remove(orderItem);
    await _orderDataSource.updateOrder(tempOrder);
  } // 재고 원복

  @override
  Future<Order> updateOrderStatus(Order order, String target) async {
    return _orderDataSource.updateOrder(order.copyWith(status: target));
  }
}
