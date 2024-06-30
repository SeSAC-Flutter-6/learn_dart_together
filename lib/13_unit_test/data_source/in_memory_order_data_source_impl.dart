import 'package:learn_dart_together/13_unit_test/data_source/order_data_source.dart';
import 'package:learn_dart_together/13_unit_test/model/order.dart';

final class InMemoryOrderDataSourceImpl implements OrderDataSource {
  List<Order> orders = [];

  @override
  Future<void> addOrderItem(Order order) async => orders.add(order);

  @override
  Future<void> cancelOrder(Order order) async => orders.remove(order);

  @override
  Future<List<Order>> getOrder() async => orders;

  @override
  Future<List<Order>> getOrdersByUser(int userId) async => orders.where((e) => e.userId == userId).toList();

  @override
  Future<void> removeOrderItem(Order order) async => orders.remove(order);

  @override
  Future<void> updateOrderStatus(Order order) async {
    orders.removeWhere((e) => e.id == order.id);
    orders.add(order);
  }
}