import 'package:flutter/material.dart';
import 'package:tasks_organizer/model/task_data.dart';
import 'package:tasks_organizer/my_costume_widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (checkboxState) {
                  // if (checkboxState != null) {
                  //   setState(() {
                  //     Provider.of<TaskData>(context).tasks[index].toggleDone() ;
                  //   });
                  // }
                });
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}
