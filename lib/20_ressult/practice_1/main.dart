import 'package:learn_dart_together/20_ressult/practice_1/repository/cal_repository_impl.dart';

void main() {
  CalRepositoryImpl calRepositoryImpl = CalRepositoryImpl();
  print(calRepositoryImpl.add(9223372036854775807, 1));
  print(calRepositoryImpl.divide(5, 3));
  print(calRepositoryImpl.divide(5, 0));
}
