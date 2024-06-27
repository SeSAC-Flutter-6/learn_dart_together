import 'dart:math';

import 'package:collection/collection.dart';
import 'package:learn_dart_together/19_unit_test/data_source/mask_store_data_source.dart';
import 'package:learn_dart_together/19_unit_test/model/store.dart';
import 'package:learn_dart_together/19_unit_test/repository/mask_store_repository.dart';
import 'package:learn_dart_together/19_unit_test/data_source/location_data_source.dart';

class MaskStoreRepositoryImpl implements MaskStoreRepository {
  final MaskStoreDataSource _maskStoreDataSource;
  final LocationDataSource _locationDataSource;

  const MaskStoreRepositoryImpl({
    required MaskStoreDataSource maskStoreDataSource,
    required LocationDataSource locationDataSource,
  })  : _maskStoreDataSource = maskStoreDataSource,
        _locationDataSource = locationDataSource;

  double _getDistance(double lat1, double lng1, double lat2, double lng2) {
    const double R = 6371.0; // 지구의 반지름 (단위: km)

    double toRadians(double degree) {
      return degree * pi / 180;
    }

    double dLat = toRadians(lat2 - lat1);
    double dLon = toRadians(lng2 - lng1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(toRadians(lat1)) *
            cos(toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = R * c;

    return distance;
  }

  @override
  Future<List<Store>> getAllStores() async {
    final (num, num) location = await _locationDataSource.getCurrentLocation();
    return await _maskStoreDataSource.getStores(location.$1, location.$2);
  }

  @override
  Future<List<Store>> getNearbyStores() async {
    final stores = await getAllStores();
    // 소팅
    return stores
        .sorted((a, b) => -_getDistance(a.lat, a.lng, b.lat, b.lng).toInt())
        .toList();
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
}
