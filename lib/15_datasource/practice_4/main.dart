import 'train_time_info.dart';
import '../../data_source/train_data_source.dart';

void main() async {
  List<TrainTimeInfo> users = await TrainDataSource().getInfos();
  users.forEach(print);
  print('\n');
  print(users.where((user) => user.subwayId == 1001).toList());
}
