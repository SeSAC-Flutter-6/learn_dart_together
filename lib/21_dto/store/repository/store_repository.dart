import 'package:learn_dart_together/21_dto/store/model/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStores();
}
