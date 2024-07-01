import 'dart:math';

import 'package:collection/collection.dart';
import 'package:learn_dart_together/14_dto_mapper/data_source/mask_store/mask_store_api.dart';
import 'package:learn_dart_together/14_dto_mapper/dto/mask_store_dto.dart';
import 'package:learn_dart_together/14_dto_mapper/mapper/mask_store_mapper.dart';
import 'package:learn_dart_together/14_dto_mapper/model/mask_store.dart';
import 'package:learn_dart_together/14_dto_mapper/repository/mask_store/mask_store_repository.dart';

class MaskStoreRepositoryImpl implements MaskStoreRepository {
  final MaskStoreAPI _maskStoreAPI;

  const MaskStoreRepositoryImpl({
    required MaskStoreAPI maskStoreAPI,
  }) : _maskStoreAPI = maskStoreAPI;

  @override
  Future<List<MaskStore>> getAllStores() async {
    final List<MaskStoreDTO> storeDtos = await _maskStoreAPI.getStores();
    return storeDtos.map((dto) => dto.toMaskStore()).toList();
  }

  @override
  Future<List<MaskStore>> getNearbyStores(
      {required double userLat,
        required double userLng,
        double radius = 3.0}) async {
    // 모든 상점을 가져오고 인접 상점만 필터링
    final List<MaskStore> stores = await getAllStores();

    // 반경 내에 있는 상점만 필터링
    return stores.where((store) {
      final double distance =
      _getDistance(userLat, userLng, store.latitude, store.longitude);
      return distance <= radius;
    }).toList();
  }

  @override
  Future<MaskStore?> getStore(String name) async {
    final List<MaskStore> stores = await getAllStores();
    return stores.firstWhereOrNull(
            (store) => store.title.toLowerCase() == name.toLowerCase());
  }

  @override
  Future<List<MaskStore>> getStoresByRemainStat(MaskRemainStatus status) async {
    final List<MaskStore> stores = await getAllStores();
    return stores.where((store) => store.remainStatus == status).toList();
  }
}

// 거리 계산 함수 (위도, 경도를 기반으로 두 지점 간의 거리 계산)
double _getDistance(double lat1, double lng1, double lat2, double lng2) {
  const double R = 6371.0;

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

  return R * c;
}