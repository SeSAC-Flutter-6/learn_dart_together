import 'package:learn_dart_together/14_unit_test/order_system/data_source/product_data_source.dart';
import 'package:learn_dart_together/14_unit_test/order_system/model/product.dart';

class InMemoryProductDataSourceImpl implements ProductDataSource {
  List<Product> _productList = [
    Product(
      id: 1,
      name: '떡볶이',
      price: 100,
      stock: 20,
    ),
    Product(
      id: 2,
      name: '짜장면',
      price: 300,
      stock: 10,
    ),
    Product(
      id: 3,
      name: '피자',
      price: 1000,
      stock: 0,
    ),
  ];

  @override
  Future<void> createProduct(Product product) async {
    _productList.add(product);
  }

  @override
  Future<void> deleteProduct(int id) async {
    _productList = _productList.where((product) => product.id != id).toList();
  }

  @override
  Future<Product?> getProduct(int id) async =>
      _productList.singleWhere((product) => product.id == id);

  @override
  Future<List<Product>> getProducts() async => _productList;

  @override
  Future<Product> updateProduct(Product product) async {
    final index =
        _productList.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      _productList[index] = product;
    } else {
      throw Exception('해당 상품이 없습니다.');
    }
    return _productList[index];
  }
}
