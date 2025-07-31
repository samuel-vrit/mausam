void main() async {
  await runTasks();
}

Future<void> runTasks() async {
  task1();
  String? task2data = await task2();
  task3(task2data);
  // task4();
}

task1() {
  print("Task 1 complete");
}

Future<String?> task2() async {
  Duration fiveSec = Duration(seconds: 5);
  String? tempString;

  await Future.delayed(fiveSec, () {
    tempString = 'Samuel Thapa';
    print("Task 2 complete");
  });

  return tempString;
}

task3(String? data) {
  print("Task 3 running, Data from task 2: $data");
}

// task4() {
//   print('Task 4 complete');
// }
