import 'package:learn_dart_together/20_dto_mapper/model/store.dart';

abstract interface class MaskRepository {
  Future<List<Store>> getMasks();
}
