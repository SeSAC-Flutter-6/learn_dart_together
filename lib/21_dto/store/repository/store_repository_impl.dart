import 'package:learn_dart_together/21_dto/store/data_source/store_data_source.dart';
import 'package:learn_dart_together/21_dto/store/mapper/store_mapper.dart';
import 'package:learn_dart_together/21_dto/store/model/store.dart';
import 'package:learn_dart_together/21_dto/store/repository/store_repository.dart';

class StoreRepositoryImpl implements StoreRepository {
  final StoreDataSource _storeDataSource;

  StoreRepositoryImpl(this._storeDataSource);

  @override
  Future<List<Store>> getStores() async {
    final data = await _storeDataSource.getStoreDto();
    return data.map((e) => e.dtoToModel()).toList();
  }
}
