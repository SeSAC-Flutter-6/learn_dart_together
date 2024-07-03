import 'package:learn_dart_together/18_test/model/store.dart';

abstract interface class MaskStoreDataSource {
  Future<List<Store>> getAllStores();
}