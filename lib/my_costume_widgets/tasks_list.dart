import 'package:flutter/material.dart';
import 'package:tasks_organizer/model/task.dart';
import 'package:tasks_organizer/my_costume_widgets/task_tile.dart';

class TasksList extends StatefulWidget {

    final List<Task> tasks ;
    const TasksList(this.tasks, {Key? key}) : super(key: key);


  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        //scrollDirection: Axis.vertical,
      itemBuilder: (context, index){
        return TaskTile(
            taskTitle: widget.tasks[index].name,
            isChecked:widget.tasks[index].isDone,
            checkboxCallback:(checkboxState) {
            if (checkboxState != null) {
              setState(() {
                widget.tasks[index].toggleDone() ;
              });
            }
            }
        );
        } ,
      itemCount: widget.tasks.length,
        );
  }
}