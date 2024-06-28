import 'package:collection/collection.dart';
import 'package:learn_dart_together/17_test/data_source/in_memory_mask_store_data_source_impl.dart';
import 'package:learn_dart_together/17_test/data_source/location_data_source.dart';
import 'package:learn_dart_together/17_test/model/store.dart';
import 'package:learn_dart_together/17_test/repository/mask_store_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('재고 상태별 약국 목록 조회', () async {
    final maskStoreRepository = MaskStoreRepositoryImpl(
      maskStoreDataSource: InMemoryMaskStoreDataSourceImpl(),
      locationDataSource: MockLocationDataSourceImpl(),
    );

    var results = await maskStoreRepository.getStoresByRemainStat("break");
    expect(results.isNotEmpty, true);

    results = await maskStoreRepository.getStoresByRemainStat("some");
    expect(results.isNotEmpty, true);

    results = await maskStoreRepository.getStoresByRemainStat("plenty");
    expect(results.isNotEmpty, true);

    results = await maskStoreRepository.getStoresByRemainStat("null");
    expect(results.isEmpty, true);
  });

  test('특정 약국 정보 조회', () async {
    final maskStoreRepository = MaskStoreRepositoryImpl(
      maskStoreDataSource: InMemoryMaskStoreDataSourceImpl(),
      locationDataSource: MockLocationDataSourceImpl(),
    );

    var store = await maskStoreRepository.getStore('청구약국');
    expect(store != null, true);

    store = await maskStoreRepository.getStore('대지약국');
    expect(store != null, true);

    store = await maskStoreRepository.getStore('승약국');
    expect(store != null, true);

    store = await maskStoreRepository.getStore('생존약국');
    expect(store == null, true);
  });

  test('전체 약국 목록 조회', () async {
    final maskStoreRepository = MaskStoreRepositoryImpl(
      maskStoreDataSource: InMemoryMaskStoreDataSourceImpl(),
      locationDataSource: MockLocationDataSourceImpl(),
    );

    final results = await maskStoreRepository.getAllStores();
    expect(results.length, 3);
  });

  test('특정 위치 반경 내 약국 목록 조회', () async {
    final maskStoreRepository = MaskStoreRepositoryImpl(
      maskStoreDataSource: InMemoryMaskStoreDataSourceImpl(),
      locationDataSource: MockLocationDataSourceImpl(),
    );

    final results = await maskStoreRepository.getNearbyStores();
    expect(
        results.equals([
          Store.fromJson({
            "addr": "서울역",
            "code": "11817488",
            "created_at": "2020/07/03 11:00:00",
            "lat": 1.0,
            "lng": 1.0,
            "name": "승약국",
            "remain_stat": "plenty",
            "stock_at": "2020/07/02 18:05:00",
            "type": "01"
          }),
          Store.fromJson({
            "addr": "청년취업사관학교 영등포",
            "code": "12856941",
            "created_at": "2020/07/03 11:00:00",
            "lat": 2.0,
            "lng": 2.0,
            "name": "대지약국",
            "remain_stat": "break",
            "stock_at": "2020/07/03 10:45:00",
            "type": "01"
          }),
          Store.fromJson({
            "addr": "수원역",
            "code": "11819723",
            "created_at": "2020/07/03 11:00:00",
            "lat": 3.0,
            "lng": 3.0,
            "name": "청구약국",
            "remain_stat": "some",
            "stock_at": "2020/07/03 10:40:00",
            "type": "01"
          }),
        ]),
        true);
  });
}

class MockLocationDataSourceImpl implements LocationDataSource {
  @override
  Future<(num, num)> getCurrentLocation() async {
    return (0.0, 0.0);
  }
}
