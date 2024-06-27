import '../model/product.dart';

abstract interface class ProductDataSource {
  Future<List<Product>> fetchProducts();
}
