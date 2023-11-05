import 'package:flutter/material.dart';


class TaskCheckbox extends StatelessWidget {
  final bool checkboxState ;
  final Function toggleCheckboxState ;

  const TaskCheckbox( {required this.checkboxState,required this.toggleCheckboxState,super.key});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.teal[400],
      value: checkboxState,
      onChanged: toggleCheckboxState(),
    );
  }
}

