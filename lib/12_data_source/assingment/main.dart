import 'dart:io';

import 'package:learn_dart_together/data_source/todo_data_source.dart';

Future<void> main() async {
  final dataSource = TodoDataSource();
  final savePath = 'lib/12_data_source/assingment';

  // assingment 1
  final id = 1;
  final todo = dataSource.getTodo(id);
  final File assingment1 = File('$savePath/assingment1');
  await assingment1.writeAsString((await todo).toString());

  // assingment 2
  final todos = dataSource.getTodos();
  final File assingment2 = File('$savePath/assingment2');
  await assingment2.writeAsString((await todos).toString());

  // assingment 3
  final users = dataSource.getUsers();
  final File assingment3 = File('$savePath/assingment3');
  await assingment3.writeAsString((await users).toString());

  // assingment 4
  final subways = dataSource.getSubways();
  final File assingment4 = File('$savePath/assingment4');
  await assingment4.writeAsString((await subways).toString());

  // assingment 5
  final status = dataSource.getStatuses();
  final File assingment5 = File('$savePath/assingment5');
  await assingment5.writeAsString((await status).toString());
}


