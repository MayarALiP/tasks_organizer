import 'package:flutter/material.dart';
import 'package:tasks_organizer/my_costume_widgets/task_checkbox.dart';

class TaskTile extends StatefulWidget {
   const TaskTile({super.key});
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TaskCheckbox(
          checkboxState: isChecked,
          toggleCheckboxState: (bool checkboxState) {
            setState(() {
              isChecked = checkboxState;
            });
          }),
      title: const Text(
        "This is Task1",
       // style: TextStyle(
          // if the isChecked toggled to true the text will be lineThrough
          // if not there will be no decoration
            //decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {},
      ),
    );
  }
}
