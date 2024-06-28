import 'package:collection/collection.dart';
import 'package:learn_dart_together/17_test/data_source/mask_store_data_source.dart';
import 'package:learn_dart_together/17_test/repository/mask_store_repository.dart';
import '../data_source/location_data_source.dart';
import '../model/store.dart';

class MaskStoreRepositoryImpl implements MaskStoreRepository {
  final MaskStoreDataSource _maskStoreDataSource;
  final LocationDataSource _locationDataSource;

  MaskStoreRepositoryImpl(
      {required MaskStoreDataSource maskStoreDataSource,
      required LocationDataSource locationDataSource})
      : _maskStoreDataSource = maskStoreDataSource,
        _locationDataSource = locationDataSource;

  double _getDistance(num lat1, num lngn1, num lat2, num lng2) {
    return 0.0;
  }

  @override
  Future<List<Store>> getAllStores() async {
    final (num, num) location = await _locationDataSource.getCurrentLocation();
    return await _maskStoreDataSource.getStores(location.$1, location.$2);
  }

  @override
  Future<Store?> getStore(String name) async {
    final stores = await getAllStores();
    return stores.singleWhereOrNull((e) => e.name == name);
  }

  @override
  Future<List<Store>> getStoresByRemainStat(String remainStat) async {
    final stores = await getAllStores();
    return stores.where((e) => e.remainStat == remainStat).toList();
  }

  @override
  Future<List<Store>> getNearbyStores() async {
    final stores = await getAllStores();
    return [];
  }
}
