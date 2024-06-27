import 'package:learn_dart_together/12_data_source/realtime_station_arrival.dart';

abstract interface class SubwayService {
  Future<List<RealtimeStationArrival>> getRealtimeStationArrival(
      {required String startIndex,
      required String endIndex,
      required String statnNm});
  Future<List<RealtimeStationArrival>> getRealtimeStationArrivalUsingXmlPackage(
      {required String startIndex,
      required String endIndex,
      required String statnNm});
}
