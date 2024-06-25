import 'package:learn_dart_together/data_source/stock/stock_service_impl.dart';
import 'package:test/test.dart';
import 'package:learn_dart_together/data_source/subway/subway_service_impl.dart';

void main() {
  test('Measure Direct XML Parsing Performance', () async {
    final subwayService = SubwayServiceImpl();
    final Stopwatch stopwatch = Stopwatch()..start();
    await subwayService.getRealtimeStationArrival(
        startIndex: 0.toString(), endIndex: 5.toString(), statnNm: '서울');
    stopwatch.stop();
    print('직접 XML 파싱 시간: ${stopwatch.elapsedMilliseconds} ms');
  });

  test('Measure XML Package Parsing Performance', () async {
    final subwayService = SubwayServiceImpl();
    final Stopwatch stopwatch = Stopwatch()..start();
    await subwayService.getRealtimeStationArrivalUsingXmlPackage(
        startIndex: 0.toString(), endIndex: 5.toString(), statnNm: '서울');
    stopwatch.stop();
    print('패키지사용 XML 파싱 시간: ${stopwatch.elapsedMilliseconds} ms');
  });

  test('Measure Direct CSV Parsing Performance', () async {
    final stockService = StockServiceImpl();
    final Stopwatch stopwatch = Stopwatch()..start();
    await stockService.getStockAndETFList();
    stopwatch.stop();
    print('직접 CSV 파싱 시간: ${stopwatch.elapsedMilliseconds} ms');
  });

  test('Measure CSV Package Parsing Performance', () async {
    final stockService = StockServiceImpl();
    final Stopwatch stopwatch = Stopwatch()..start();
    await stockService.getStockAndETFListUsingCsvPackage();
    stopwatch.stop();
    print('패키지사용 CSV 파싱 시간: ${stopwatch.elapsedMilliseconds} ms');
  });
}
