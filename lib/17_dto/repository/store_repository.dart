import 'package:learn_dart_together/17_dto/data_source/store_data_source.dart';
import 'package:learn_dart_together/17_dto/mapper/store_mapper.dart';
import 'package:learn_dart_together/17_dto/model/store.dart';

abstract interface class StoreRepository {
  Future<List<Store>> getStores();
}

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _storeDataSource;

  StoreRepositoryImpl(this._storeDataSource);

  @override
  Future<List<Store>> getStores() async {
    final storeDto = await _storeDataSource.getStores();
    final stores = storeDto
        .where((dto) => dto.name != null)
        .map((dto) => dto.toStore())
        .toList();
    return List.unmodifiable(stores);
  }
}
