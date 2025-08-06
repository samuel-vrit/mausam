void main() async {
  await runTasks();
}

Future<void> runTasks() async {
  task1();
  String? task2data = await task2();
  task3(task2data);
  task4();
}

task1() {
  print("Task 1 complete");
}

Future<String?> task2() async {
  Duration fiveSec = Duration(seconds: 5);
  String? tempString;

  Future.delayed(fiveSec, () {
    tempString = 'Samuel Thapa';
    print("Task 2 complete");
  });

  return tempString;
}

Future<void> task3(String? data) async {
  Future.delayed(Duration(seconds: 1), () {
    print("Task 3 complete, Data from task 2: $data");
  });
}

task4() {
  print('Task 4 complete');
}
