import 'package:learn_dart_together/18_dto_mapper/data_source/mask_store_data_source.dart';
import 'package:learn_dart_together/18_dto_mapper/mapper/mask_store_mapper.dart';
import 'package:learn_dart_together/18_dto_mapper/model/store.dart';
import 'package:learn_dart_together/18_dto_mapper/repository/mask_store_repository.dart';

class MaskStoreRepositoryImpl implements MaskStoreRepository {
  final MaskStoreDataSource _maskStoreDataSource;

  MaskStoreRepositoryImpl(this._maskStoreDataSource);

  @override
  Future<List<Store>> getStores() async {
    final maskStoreDto = await _maskStoreDataSource.getStores();

    return maskStoreDto
        .where((dto) => dto.name != null)
        .map((dto) => dto.toStore())
        .toList();
  }
}
