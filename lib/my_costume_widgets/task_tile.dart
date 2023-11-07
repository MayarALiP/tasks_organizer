import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final Function deleteTask;
  final Function editTask;

  const TaskTile({
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
    required this.deleteTask,
    required this.editTask,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            editTask () ;
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            deleteTask();
          },
        ),
      ]),
    );
  }
}
