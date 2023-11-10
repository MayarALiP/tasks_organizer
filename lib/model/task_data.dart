import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:tasks_organizer/model/task.dart';

class TaskData extends ChangeNotifier {

  // I made it a privet data to force myself not to access tasks.add or tasks.remove
  // without the provider Listener !!
   final List<Task> _tasks = [
    Task(name: "design Dashboard Screen"),
    Task(name: "design Profile Screen"),
    Task(name: "made a Delete button works "),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get tasksCount {
    return _tasks.length ;
  }

  void addNewTask( String newTaskTitle) {
    final task =Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void taskStatus (Task task){
    task.toggleDone();
    notifyListeners();

}

  void taskDeleting (Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void taskEditing(int index, String newTitle) {
      _tasks[index].name = newTitle;
      // just for debugging
      print("i am here");
      notifyListeners();
    }

}


