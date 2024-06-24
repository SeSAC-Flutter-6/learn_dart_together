import 'stock_info.dart';
import 'stock_info_list.dart';
import '../../data_source/stock_data_source.dart';

void main() async {
  List<StockInfo> stockInfo = await StockDataSource().getStocks();
  stockInfo
      .where((element) => element.exchange == Exchange.NYSE_ARCA)
      .forEach(print);
}
