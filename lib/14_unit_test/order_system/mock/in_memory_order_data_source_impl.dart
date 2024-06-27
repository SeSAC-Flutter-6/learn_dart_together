import 'dart:convert';

import 'package:learn_dart_together/14_unit_test/order_system/data_source/order_data_source.dart';
import 'package:learn_dart_together/14_unit_test/order_system/model/order.dart';

class InMemoryOrderDataSourceImpl implements OrderDataSource {
  final List<Map<String, dynamic>> _json = [
    {
      "id": 1,
      "userId": 1,
      "status": "ordered",
      "createdAt": "2023-05-04 18:46:45.546",
      "orderItems": [
        {
          "id": 1,
          "productId": 1,
          "quantity": 10,
          "price": 1000,
        }
      ],
    },
    {
      "id": 2,
      "userId": 2,
      "status": "canceled",
      "createdAt": "2023-05-04 18:46:45.546",
      "orderItems": [
        {
          "id": 1,
          "productId": 1,
          "quantity": 10,
          "price": 1000,
        }
      ],
    },
    {
      "id": 3,
      "userId": 3,
      "status": "delivered",
      "createdAt": "2023-05-04 18:46:45.546",
      "orderItems": [
        {
          "id": 3, // 주문한 상품의 아이디
          "productId": 2, // 상품의 아이디
          "quantity": 5,
          "price": 1000,
        }
      ],
    }
  ];

  List<Map<String, dynamic>> get json => _json;

  @override
  Future<void> createOrder(Order order) async {
    _json.add(order.toJson());
  }

  @override
  Future<void> deleteOrder(int id) async {
    final target = _json.singleWhere((order) => order['id'] == id);
    _json.remove(target);
  }

  @override
  Future<Order?> getOrder(int id) async =>
      Order.fromJson(_json.singleWhere((order) => order['id'] == id));

  @override
  Future<List<Order>> getOrders() async =>
      _json.map((order) => Order.fromJson(order)).toList();

  @override
  Future<Order> updateOrder(Order order) async {
    final index = _json.indexWhere((e) => e['id'] == order.id);
    if (index != -1) {
      _json[index] = order.toJson();
    } else {
      throw Exception('해당 주문이 없습니다.');
    }
    return Order.fromJson(_json[index]);
  }
}
