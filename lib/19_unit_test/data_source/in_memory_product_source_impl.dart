import 'package:learn_dart_together/19_unit_test/model/product.dart';
import 'package:learn_dart_together/19_unit_test/data_source/product_data_source.dart';

class InMemoryProductDataSourceImpl implements ProductDataSource {
  final Map<int, Product> _products = {
    1: Product(id: 1, name: 'Product 1', price: 10.0, stock: 100),
    2: Product(id: 2, name: 'Product 2', price: 20.0, stock: 50),
    3: Product(id: 3, name: 'Product 3', price: 30.0, stock: 200),
  };

  @override
  Future<Product?> getProduct(int productId) async {
    return _products[productId];
  }

  @override
  Future<void> updateProductStock(int productId, int newStock) async {
    if (_products.containsKey(productId)) {
      _products[productId] = _products[productId]!.copyWith(stock: newStock);
    }
  }
}
