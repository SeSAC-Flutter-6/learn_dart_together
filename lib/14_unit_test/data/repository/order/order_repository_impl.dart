import 'package:learn_dart_together/14_unit_test/data/data_source/order/order_api.dart';
import 'package:learn_dart_together/14_unit_test/data/data_source/product/product_api.dart';
import 'package:learn_dart_together/14_unit_test/data/enum/order_status.dart';
import 'package:learn_dart_together/14_unit_test/data/model/order.dart';
import 'package:learn_dart_together/14_unit_test/data/model/order_item.dart';
import 'package:learn_dart_together/14_unit_test/data/model/product.dart';
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
      // 주문할 아이템의 productId 리스트를 추출
      List<int> productIdList =
          order.orderItems.map((item) => item.productId).toList();

      // API를 통해 해당 productId 리스트에 해당하는 상품 데이터를 가져옴.
      final List<Map<String, dynamic>> productListData =
          await _productApi.getProducts(productIdList);
      List<Product> productList = productListData
          .map((productData) => Product.fromJson(productData))
          .toList();

      // 주문 가능 여부를 확인
      for (var orderItem in order.orderItems) {
        int index = productList
            .indexWhere((product) => product.id == orderItem.productId);
        if (index == -1) {
          print('productId ${orderItem.productId}번 상품은 존재하지 않는 상품입니다');
          return false;
        }
        if (orderItem.quantity > productList[index].stock) {
          print(
              '${productList[index].name} 상품의 재고가 부족합니다. (재고: ${productList[index].stock}, 주문량: ${orderItem.quantity})');
          return false;
        }
      }

      await _orderApi.createOrder(order.toJson());
      return true;
    } catch (error) {
      throw Exception('Error creating order: $error');
    }
  }

  @override
  Future<bool> addOrderItem(int orderId, OrderItem item) async {
    try {
      bool orderExists = await _orderApi.checkOrderExists(orderId);
      if (!orderExists) {
        print('존재하지 않는 주문입니다');
        return false;
      }
      final String orderStatusData = await _orderApi.getOrderStatus(orderId);
      if (parseStatus(orderStatusData) == OrderStatus.completed) {
        print('완료된 주문에는 상품을 추가할 수 없습니다');
        return false;
      }
      //_product Api 에서 주문할 아이템의 수량이 존재하는지 확인.
      final List<Map<String, dynamic>> productData =
          await _productApi.getProducts([item.productId]);
      Product product = Product.fromJson(productData.first);
      if (item.quantity > product.stock) {
        print('상품 수량이 부족합니다');
        return false;
      }
      await _orderApi.addOrderItem(orderId: orderId, orderItem: item.toJson());
      return true;
    } catch (error) {
      throw Exception('Error adding orderItem: $error');
    }
  }

  @override
  Future<int?> calculateOrderTotal(int orderId) async {
    int totalPrice = 0;
    try {
      bool orderExists = await _orderApi.checkOrderExists(orderId);
      if (!orderExists) {
        print('존재하지 않는 주문입니다');
        return null;
      }
      final orderData = await _orderApi.getOrder(orderId);
      Order order = Order.fromJson(orderData!);
      for (var orderItem in order.orderItems) {
        totalPrice += orderItem.price;
      }
      return totalPrice;
    } catch (error) {
      throw Exception('Error adding orderItem: $error');
    }
  }

  @override
  Future<bool> cancelOrder(int orderId) async {
    try {
      bool orderExists = await _orderApi.checkOrderExists(orderId);
      if (!orderExists) {
        print('존재하지 않는 주문입니다');
        return false;
      }
      final String orderStatusData = await _orderApi.getOrderStatus(orderId);
      OrderStatus orderStatus = parseStatus(orderStatusData);
      if (orderStatus == OrderStatus.completed ||
          orderStatus == OrderStatus.processing) {
        print('완료되거나, 처리 중인 주문은 취소할 수 없습니다');
        return false;
      }
      await _orderApi.cancelOrder(orderId);
      return true;
    } catch (error) {
      throw Exception('Error adding orderItem: $error');
    }
  }

  @override
  Future<Order?> getOrder(int orderId) async {
    try {
      bool orderExists = await _orderApi.checkOrderExists(orderId);
      if (!orderExists) {
        print('존재하지 않는 주문입니다');
        return null;
      }
      final orderData = await _orderApi.getOrder(orderId);
      return Order.fromJson(orderData!);
    } catch (error) {
      throw Exception('Error getting order: $error');
    }
  }

  @override
  Future<List<Order>> getOrdersByUser(String userId) async {
    try {
      final List<Map<String, dynamic>> orderDataList =
          await _orderApi.getOrdersByUser(userId);
      if (orderDataList.isEmpty) {
        return [];
      }
      return orderDataList
          .map((orderData) => Order.fromJson(orderData))
          .toList();
    } catch (error) {
      throw Exception('Error getting orders by user: $error');
    }
  }

  @override
  Future<bool> removeOrderItem(int orderId, OrderItem item) async {
    try {
      bool orderExists = await _orderApi.checkOrderExists(orderId);
      if (!orderExists) {
        print('존재하지 않는 주문입니다');
        return false;
      }
      final String orderStatusData = await _orderApi.getOrderStatus(orderId);
      OrderStatus orderStatus = parseStatus(orderStatusData);
      if (orderStatus == OrderStatus.completed ||
          orderStatus == OrderStatus.processing) {
        print('완료되거나, 처리 중인 주문의 상품은 제거할 수 없습니다');
        return false;
      }
      final orderData = await _orderApi.getOrder(orderId);
      Order order = Order.fromJson(orderData!);
      int index =
          order.orderItems.indexWhere((orderItem) => orderItem.id == item.id);
      if (index == -1) {
        print('제거하려는 상품(${item.id})이 주문($orderId)에 존재하지 않습니다.');
        return false;
      }
      OrderItem removedOrderItem = order.orderItems.removeAt(index);
      await _orderApi.deleteOrderItem(
          orderId: orderId, orderItem: removedOrderItem.toJson());
      return true;
    } catch (error) {
      throw Exception('Error removing orderItem: $error');
    }
  }

  @override
  Future<bool> updateOrderStatus(int orderId, OrderStatus updatedStatus) async {
    try {
      bool orderExists = await _orderApi.checkOrderExists(orderId);
      if (!orderExists) {
        print('존재하지 않는 주문입니다');
        return false;
      }
      final orderData = await _orderApi.getOrder(orderId);
      Order order = Order.fromJson(orderData!);
      //updatedStatus는 현재상태와 같거나 더 이전으로 변경할 수 없음
      if (updatedStatus.value <= order.status.value) {
        return false;
      }
      await _orderApi.updateOrderStatus(
          orderId: orderId, updatedStatus: updatedStatus.toString());
      return true;
    } catch (error) {
      throw Exception('Error updating user: $error');
    }
  }
}
