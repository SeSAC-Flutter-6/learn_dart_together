import 'package:learn_dart_together/15_dto_mapper/data_source/mask_store/mask_store_api.dart';
import 'package:learn_dart_together/15_dto_mapper/data_source/mask_store/mask_store_api_impl.dart';
import 'package:learn_dart_together/15_dto_mapper/data_source/mask_store/mock_mask_store_api.dart';
import 'package:learn_dart_together/15_dto_mapper/model/mask_store/mask_store.dart';
import 'package:learn_dart_together/15_dto_mapper/repository/mask_store/mask_store_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  group('MaskStoreRepository Tests', () {
    late MaskStoreRepositoryImpl repository;
    late MaskStoreApi realApi; // 실제 API
    late MaskStoreApi mockApi; // Mock API

    setUp(() {
      realApi = MaskStoreApiImpl(); // 실제 API 인스턴스
      mockApi = MockMaskStoreApi(); // Mock API 인스턴스
    });

    test('getAllStores', () async {
      repository = MaskStoreRepositoryImpl(maskStoreApi: realApi);
      final stores = await repository.getAllStores();
      expect(stores.length, 222);
    });

    test('getStore', () async {
      repository = MaskStoreRepositoryImpl(maskStoreApi: mockApi);

      final store1 = await repository.getStore('승약국');
      final store2 = await repository.getStore('대지약국');
      final store3 = await repository.getStore('청구약국');
      final store4 = await repository.getStore('생존약국');

      expect(store1!.title, '승약국');
      expect(store2!.title, '대지약국');
      expect(store3!.title, '청구약국');
      expect(store4, null);
    });

    test('getStoresByRemainStat', () async {
      repository = MaskStoreRepositoryImpl(maskStoreApi: realApi);

      final plentyStores =
          await repository.getStoresByRemainStat(MaskRemainStatus.plenty);
      final breakStores =
          await repository.getStoresByRemainStat(MaskRemainStatus.onBreak);
      final someStores =
          await repository.getStoresByRemainStat(MaskRemainStatus.some);
      final nullStores =
          await repository.getStoresByRemainStat(MaskRemainStatus.empty);

      expect(plentyStores.length, 178);
      expect(breakStores.length, 15);
      expect(someStores.length, 13);
      expect(nullStores.length, 6);
    });

    test('getNearbyStores', () async {
      repository = MaskStoreRepositoryImpl(maskStoreApi: mockApi);

      final nearbyStores = await repository.getNearbyStores(
        userLat: 37.5249,
        userLng: 126.9374,
        radius: 10.0,
      );

      expect(nearbyStores.length, 2);
    });
  });
}
