import '../model/order.dart';

abstract interface class OrderDataSource {
  Future<List<Order>> fetchOrders();
}
