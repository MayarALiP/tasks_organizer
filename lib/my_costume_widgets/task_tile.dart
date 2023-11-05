import 'package:flutter/material.dart';
import 'package:tasks_organizer/my_costume_widgets/task_checkbox.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({super.key});
  @override
  State<TaskTile> createState() => _TaskTileState();
}
class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;
  void checkboxCallback(bool? checkboxState) {
    if (checkboxState != null) {
      setState(() {
        isChecked = checkboxState;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TaskCheckbox(
        checkboxState: isChecked,
        toggleCheckboxState: checkboxCallback,
      ),
      title: Text(
        "This is Task1",
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {},
      ),
    );
  }
}




