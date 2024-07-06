import 'package:learn_dart_together/18_design/controller/file_controller.dart';
import 'package:learn_dart_together/18_design/data/data_source/book_data_source.dart';
import 'package:learn_dart_together/18_design/data/data_source/checkout_data_source.dart';
import 'package:learn_dart_together/18_design/data/data_source/user_data_source.dart';
import 'package:learn_dart_together/18_design/data/repository_impl/book_repository_impl.dart';
import 'package:learn_dart_together/18_design/data/repository_impl/checkout_repository_impl.dart';
import 'package:learn_dart_together/18_design/data/repository_impl/user_repository_impl.dart';
import 'package:learn_dart_together/18_design/service/manage/book_manage.dart';
import 'package:learn_dart_together/18_design/service/manage/checkout_manage.dart';
import 'package:learn_dart_together/18_design/service/manage/user_manage.dart';

import 'service/library_service.dart';

void main() async {
  final fileController = FileController();

  final userDataSource = UserDataSource();
  final userRepositoryImpl = UserRepositoryImpl(userDataSource);
  final userService = UserManage(userRepositoryImpl);

  final bookDataSource = BookDataSource();
  final bookRepositoryImpl = BookRepositoryImpl(bookDataSource);
  final bookService = BookManage(bookRepositoryImpl);

  final checkoutDataSource = CheckoutDataSource();
  final checkoutRepositoryImpl = CheckoutRepositoryImpl(checkoutDataSource, bookDataSource);
  final checkoutService = CheckoutManage(
    checkoutRepositoryImpl,
    userRepositoryImpl,
    bookRepositoryImpl,
  );

  final libraryService = LibraryService(
    fileController,
    userService,
    bookService,
    checkoutService,
  );

  libraryService.start();
}
