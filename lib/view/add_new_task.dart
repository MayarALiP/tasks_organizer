import 'package:flutter/material.dart';

class AddNewTask extends StatelessWidget {
  final Function addTaskCallback ;
   const AddNewTask(this.addTaskCallback, {super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "" ;

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
                onPressed: () {
                  addTaskCallback(newTaskTitle);
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(Colors.teal[400])),
                child: const Text(
                  "Add",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
