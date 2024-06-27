import 'package:learn_dart_together/17_test/practice_3/model/store.dart';

abstract interface class MaskStoreRepository {
  Future<List<Store>> getAllStores();
  Future<Store> getStore(String name);
  Future<List<Store>> getStoresByRemainStat(String remainStat);
  Future<List<Store>> getNearbyStores();
}
