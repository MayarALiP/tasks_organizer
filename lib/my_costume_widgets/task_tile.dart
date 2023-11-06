import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
 final  bool isChecked ;
 final String taskTitle ;
 final Function(bool?) checkboxCallback;

 const TaskTile({required this.taskTitle,
   required this.isChecked,
   required this.checkboxCallback ,
   super.key
 });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked ,
        onChanged:checkboxCallback,

      ),
      title: Text(taskTitle,
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

