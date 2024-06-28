import 'package:learn_dart_together/14_unit_test/data/data_source/order/order_api.dart';
import 'package:learn_dart_together/14_unit_test/data/data_source/product/product_api.dart';
import 'package:learn_dart_together/14_unit_test/data/enum/order_status.dart';
import 'package:learn_dart_together/14_unit_test/data/model/order.dart';
import 'package:learn_dart_together/14_unit_test/data/model/order_item.dart';
import 'package:learn_dart_together/14_unit_test/data/repository/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderApi _orderApi;
  final ProductApi _productApi;

  const OrderRepositoryImpl(
      {required OrderApi orderApi, required ProductApi productApi})
      : _orderApi = orderApi,
        _productApi = productApi;

  @override
  Future<bool> createOrder(Order order) async {
    try {
      await _orderApi.createOrder(order.toJson());
      return true;
    } catch (error) {
      throw Exception('Error creating order: $error');
    }
  }

  @override
  Future<bool> addOrderItem(int orderId, OrderItem item) async {
    try {
      final String orderStatusData = await _orderApi.getOrderStatus(orderId);
      if (parseStatus(orderStatusData) == OrderStatus.completed) {
        print('완료된 주문에는 상품을 추가할 수 없습니다');
        return false;
      }
      await _orderApi.addOrderItem(orderId: orderId, orderItem: item.toJson());
      return true;
    } catch (error) {
      throw Exception('Error adding orderItem: $error');
    }
  }

  @override
  Future<int> calculateOrderTotal(int orderId) async {
     // TODO: implement calculateOrderTotal
    throw UnimplementedError();
  }

  @override
  Future<bool> cancelOrder(int orderId) async {
    // TODO: implement cancelOrder
    throw UnimplementedError();
  }

  @override
  Future<Order?> getOrder(int orderId) async {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<List<Order>> getOrdersByUser(String userId) async {
    // TODO: implement getOrdersByUser
    throw UnimplementedError();
  }

  @override
  Future<bool> removeOrderItem(int orderId, int orderItemId) async {
    // TODO: implement removeOrderItem
    throw UnimplementedError();
  }

  @override
  Future<void> updateOrderStatus(int orderId, String newStatus) async {
    // TODO: implement updateOrderStatus
    throw UnimplementedError();
  }
}
