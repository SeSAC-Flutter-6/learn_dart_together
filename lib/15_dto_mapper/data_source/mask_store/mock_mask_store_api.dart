import 'package:learn_dart_together/15_dto_mapper/data_source/mask_store/mask_store_api.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/mask_store_dto/mask_store_dto.dart';

class MockMaskStoreApi implements MaskStoreApi {
  @override
  Future<List<MaskStoreDto>> getStores({double? lat, double? lng}) async {
    final List<Map<String, dynamic>> fakeResults = [
      {
        "addr": "서울역",
        "code": "11817488",
        "created_at": "2023/05/01 10:00:00",
        "lat": 37.5555,
        "lng": 126.9736,
        "name": "승약국",
        "remain_stat": "plenty",
        "stock_at": "2023/05/01 09:30:00",
        "type": "01"
      },
      {
        "addr": "청년취업사관학교 영등포",
        "code": "12856941",
        "created_at": "2023/05/01 10:00:00",
        "lat": 37.5204,
        "lng": 126.9113,
        "name": "대지약국",
        "remain_stat": "break",
        "stock_at": "2023/05/01 09:45:00",
        "type": "01"
      },
      {
        "addr": "수원역",
        "code": "11819723",
        "created_at": "2023/05/01 10:00:00",
        "lat": 37.2668,
        "lng": 127.0000,
        "name": "청구약국",
        "remain_stat": "some",
        "stock_at": "2023/05/01 09:40:00",
        "type": "01"
      }
    ];

    final List<MaskStoreDto> storeDtos =
        fakeResults.map((result) => MaskStoreDto.fromJson(result)).toList();

    return storeDtos;
  }
}
