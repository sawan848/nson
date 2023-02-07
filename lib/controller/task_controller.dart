import 'package:get/get.dart';
import 'package:nson/db/db_helper.dart';
import 'package:nson/model/task.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }

  void getTasks2() async {
    var tasks = await DBHelper.tasks();
    tasks.map((data) {
      print(" $data");
    });
    print("tasks 2 ${tasks}");
  }

  void delete(Task task) async {
    var value = await DBHelper.delete(task);
    print(value);
    getTasks();
  }

  void markTaskCompleted(int id) async {
    await DBHelper.update(id);
    getTasks();
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    print("length: ${tasks.length}");
    taskList.assignAll(
        tasks.map((data) => new Task.fromJson(data)).toList(growable: true));
    print("lenfgt : ${taskList.length}");
  }
}
