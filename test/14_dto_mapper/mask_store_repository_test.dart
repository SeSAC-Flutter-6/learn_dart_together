import 'package:learn_dart_together/14_dto_mapper/data_source/mask_store/mock_mask_store_api.dart';
import 'package:learn_dart_together/14_dto_mapper/model/mask_store.dart';
import 'package:learn_dart_together/14_dto_mapper/repository/mask_store/mask_store_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  late MaskStoreRepositoryImpl repository;
  late MockMaskStoreAPI mockApi;

  setUp(() {
    mockApi = MockMaskStoreAPI();
    repository = MaskStoreRepositoryImpl(maskStoreAPI: mockApi);
  });

  test('모든 약국을 반환해야 합니다.', () async {
    final stores = await repository.getAllStores();
    expect(stores.length, 3);
  });

  test('인근 약국을 반환해야 합니다.', () async {
    final stores = await repository.getNearbyStores(userLat: 37.5204, userLng: 126.9113);
    expect(stores.length, 1);
    expect(stores.first.title, '대지약국');
  });

  test('이름으로 약국을 반환해야 합니다.', () async {
    final store = await repository.getStore('승약국');
    expect(store, isNotNull);
    expect(store!.title, '승약국');
  });

  test('재고 상태에 따라 약국을 반환해야 합니다.', () async {
    final stores = await repository.getStoresByRemainStat(MaskRemainStatus.plenty);
    expect(stores.length, 1);
    expect(stores.first.title, '승약국');
  });

  test('주어진 반경 내의 약국을 반환해야 합니다.', () async {
    final stores = await repository.getNearbyStores(userLat: 37.5555, userLng: 126.9736, radius: 5.0);
    expect(stores.length, 1);
    expect(stores.first.title, '승약국');
  });

  test('약국이 없는 경우 null을 반환해야 합니다.', () async {
    final store = await repository.getStore('없는약국');
    expect(store, isNull);
  });
}