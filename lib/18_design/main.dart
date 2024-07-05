import 'package:learn_dart_together/18_design/controller/file_controller.dart';
import 'package:learn_dart_together/18_design/data/data_source/user_data_source.dart';
import 'package:learn_dart_together/18_design/data/repository_impl/user_repository_impl.dart';
import 'package:learn_dart_together/18_design/service/user_manage.dart';

import 'service/library_service.dart';

void main() async {
  final fileController = FileController();
  final userDataSource = UserDataSource();
  final userRepostiroyImpl = UserRepositoryImpl(userDataSource);
  final userService = UserManage(userRepostiroyImpl);
  final libraryService = LibraryService(fileController, userService);
  libraryService.start();
}
