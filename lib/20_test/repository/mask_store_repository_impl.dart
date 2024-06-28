import 'package:collection/collection.dart';
import 'package:learn_dart_together/20_test/data_source/location_data_source.dart';
import 'package:learn_dart_together/20_test/data_source/mask_store_data_source.dart';
import 'package:learn_dart_together/20_test/model/store.dart';
import 'package:learn_dart_together/20_test/repository/mask_store_repository.dart';

class MaskStoreRepositoryImpl implements MaskStoreRepository {
  final MaskStoreDataSource _maskStoreDataSource;
  final LocationDataSource _locationDataSource;

  double _getDistance(num lat1, num lng1, num lat2, num lng2) {
    //거리구해서 리턴
    return 0.0;
  }

  MaskStoreRepositoryImpl(this._maskStoreDataSource, this._locationDataSource);

  @override
  Future<List<Store>> getAllStores() async {
    final (num, num) location = await _locationDataSource.getCurrentLocation();
    return await _maskStoreDataSource.getStores(location.$1, location.$2);
  }

  @override
  Future<List<Store>> getNearbyStores() async {
    final stores = await getAllStores();
    //소팅
    return [];
  }

  @override
  Future<Store?> getStore(String name) async {
    final stores = await getAllStores();
    stores.firstWhereOrNull((e)=>e.name == name);
  }

  @override
  Future<List<Store>> getStoresByRemainStat(String remainStat) {
    throw UnimplementedError();
  }

}
