import 'package:learn_dart_together/20_test/model/store.dart';

abstract interface class MaskStoreDataSource {
  Future<List<Store>> getStores(num lat, num lng);
}
