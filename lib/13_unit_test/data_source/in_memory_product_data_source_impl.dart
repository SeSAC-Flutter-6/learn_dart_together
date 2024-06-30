import 'package:learn_dart_together/13_unit_test/data_source/product_data_source.dart';
import 'package:learn_dart_together/13_unit_test/model/product.dart';

final class InMemoryProductDataSourceImpl implements ProductDataSource {
  Set<Product> products = {
    Product(id: 1, name: '맥북 프로', price: 35000000, stock: 5),
    Product(id: 2, name: '스튜디오 디스플레이', price: 20900000, stock: 3),
    Product(id: 3, name: '맥 스튜디오', price: 50000000, stock: 3),
    Product(id: 4, name: '아이폰 15', price: 12000000, stock: 10),
  };

  @override
  Future<Product> getProduct(int productId) async => products.singleWhere((e) => e.id == productId);

  @override
  Future<Set<Product>> getProductList() async => products;
}