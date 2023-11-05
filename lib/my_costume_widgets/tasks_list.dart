import 'package:flutter/material.dart';
import 'package:tasks_organizer/my_costume_widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children:const [
          TaskTile(),
          TaskTile(),
          TaskTile(),
        ]);
  }
}