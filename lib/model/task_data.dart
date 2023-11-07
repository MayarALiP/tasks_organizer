import 'package:flutter/material.dart';
import 'package:tasks_organizer/model/task.dart';

class TaskData extends ChangeNotifier {

  List<Task> tasks = [
    Task(name: "design Dashboard Screen"),
    Task(name: "design Profile Screen"),
    Task(name: "made a Delete "),
  ];

  int get tasksCount {
    return tasks.length ;

  }
}