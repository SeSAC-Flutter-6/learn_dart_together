import 'package:learn_dart_together/14_dto_mapper/model/mask_store.dart';

abstract interface class MaskStoreRepository {
  Future<List<MaskStore>> getAllStores();

  Future<MaskStore?> getStore(String name);

  Future<List<MaskStore>> getStoresByRemainStat(MaskRemainStatus status);

  Future<List<MaskStore>> getNearbyStores(
      {required double userLat, required double userLng, double radius = 3.0});
}
