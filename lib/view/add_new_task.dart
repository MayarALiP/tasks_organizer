import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_organizer/model/task.dart';
import 'package:tasks_organizer/model/task_data.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});


  @override
  Widget build(BuildContext context) {
    late String newTaskTitle ;

    return Container(
      // just to match the background color :)
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.teal[400],
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
             TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (inputText)
              {
               newTaskTitle=inputText ;
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Colors.teal[400])),

                child:  const Text(
                  "Add",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false).addNewTask(newTaskTitle);
                  Navigator.pop(context);
                },

              ),
            ),
          ]),
        ),
      ),
    );
  }
}
