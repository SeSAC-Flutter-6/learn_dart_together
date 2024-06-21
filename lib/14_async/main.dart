import 'dart:async';

Future<void> fetchData() async {
  print('데이터를 가져오는 중...');
  await Future.delayed(Duration(seconds: 2));
  print('데이터를 가져왔음!');
}

Future<void> performTask(int taskNumber, int delaySeconds) async {
  print('작업 $taskNumber 시작');
  await Future.delayed(Duration(seconds: delaySeconds));
  print('작업 $taskNumber 완료');
}

void main() async {
  print('프로그램 시작');

  // // 작업을 순차적으로 실행
  await fetchData();
  performTask(1, 1);
  performTask(2, 1);
  performTask(3, 1);

  // 여러 비동기 작업을 동시에 시작
  Future<void> fetchDataFuture = fetchData();
  Future<void> task1 = performTask(1, 1);
  Future<void> task2 = performTask(2, 1);
  Future<void> task3 = performTask(3, 1);

  // 모든 작업이 완료될 때까지 기다림
  await Future.wait([fetchDataFuture, task1, task2, task3]);

  print('프로그램 종료');
}
