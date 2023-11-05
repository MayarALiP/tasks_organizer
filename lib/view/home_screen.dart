import 'package:flutter/material.dart';
import 'package:tasks_organizer/my_costume_widgets/tasks_list.dart';
import 'package:tasks_organizer/view/add_new_task.dart';
import 'package:tasks_organizer/view/dashboard_screen.dart';

class MyTasksHome extends StatelessWidget {
  final String usernameW;

   const MyTasksHome(this.usernameW, {super.key});

  Widget buildBottomSheet(BuildContext context) => const AddNewTask();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar with back , profile , dashboard Icons buttons
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        centerTitle: true,
        title: Text("Welcome, $usernameW"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardScreen()),
              );
            },
            icon: const Icon(Icons.dashboard_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),


      // body where my tasks will appear
      body: const Padding(
        padding: EdgeInsets.fromLTRB(8.0, 16, 8, 0),
        child: TasksList(),
      ),

      // adding new task
      floatingActionButton: SizedBox(
        height: 90,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Colors.teal[400],
          child: const Icon(
            Icons.add,
            size: 60,
          ),
          onPressed: () {
            showModalBottomSheet(context: context, builder: buildBottomSheet);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
