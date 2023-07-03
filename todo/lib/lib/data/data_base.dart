import 'package:hive_flutter/hive_flutter.dart';
import 'package:mod8asgmt/home_screen.dart';

class TaskManagerDataBase {
//refrence the box
  final _myBox = Hive.box('myBox');
  List<Task> tasks = [];

  void loadData() {
    tasks = _myBox.get("TASKS");
  }

  void updateDataBase() {
    _myBox.put("TASKS", tasks);
  }
}
