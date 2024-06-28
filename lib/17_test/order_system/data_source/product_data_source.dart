import '../model/product.dart';

abstract interface class ProductDataSource {
  Future<Product?> getProduct(int id);

  Future<List<Product>> getProducts();

  Future<void> createProduct(Product product);

  Future<Product> updateProduct(Product product);

  Future<void> deleteProduct(int id);
}
