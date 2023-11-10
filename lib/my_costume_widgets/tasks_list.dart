import 'package:flutter/material.dart';
import 'package:tasks_organizer/model/task_data.dart';
import 'package:tasks_organizer/my_costume_widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final currentTask = taskData.tasks[index];

            void deleteTask() {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Delete Task'),
                    content: const Text('Are you sure you want to delete this task?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      TextButton(
                        child: const Text('Delete'),
                        onPressed: () {
                          taskData.taskDeleting(currentTask);
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                    ],
                  );
                },
              );
            }

            void editTask() {
              // Initialize newTitle with the current task title
              String newTitle = currentTask.name;
               controller.text = newTitle ;
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'Edit Task Title',
                      textAlign: TextAlign.center,
                    ),
                    content: TextField(
                      controller: controller,
                      autofocus: true,
                      // onChanged: (value) {
                      //   newTitle = value;
                      //   //check if the  Update newTitle when the user changes the text
                      //   print(newTitle);
                      // },
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Save'),
                        onPressed: () {
                            taskData.taskEditing(index, controller.text);
                            // Close the dialog
                            Navigator.of(context).pop();
                        }, // onPressed
                      ),
                    ],
                  );
                },
              );
            }


            return TaskTile(
              taskTitle: currentTask.name,
              isChecked: currentTask.isDone,
              checkboxCallback: (checkboxState) {
                taskData.taskStatus(currentTask);
              } ,
              deleteTask : (){
                deleteTask() ;
                } ,
              editTask: (){
                editTask();
              },
            );
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}
