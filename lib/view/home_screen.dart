import 'package:flutter/material.dart';
import 'package:tasks_organizer/model/task.dart';
import 'package:tasks_organizer/model/users.dart';
import 'package:tasks_organizer/my_costume_widgets/tasks_list.dart';
import 'package:tasks_organizer/view/add_new_task.dart';
import 'package:tasks_organizer/view/dashboard_screen.dart';
import 'package:tasks_organizer/view/profile.dart';

class MyTasksHome extends StatefulWidget {
  final String firstName;
  const MyTasksHome(this.firstName, {Key? key}) : super(key: key);

  @override
  State<MyTasksHome> createState() => _MyTasksHomeState();
}

class _MyTasksHomeState extends State<MyTasksHome> {
  List<Task> tasks = [
    Task(name: "design Dashboard Screen"),
    Task(name: "design Profile Screen"),
    Task(name: "made a Delete "),
  ];

  Widget buildBottomSheet(BuildContext context) => AddNewTask((newTaskTitle) {
        setState(() {
          tasks.add(Task(name: newTaskTitle));
        });
        Navigator.pop(context);
      });

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
        title: Text("Welcome, ${widget.firstName}"),
      ),

      endDrawer: Drawer(
        width: 200,
        child: ListView(padding: EdgeInsets.zero, children: [
          const SizedBox(
            height: 75,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "go to ?.. ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(tasks, firstName: widget.firstName,),
                    ));
              },
              icon: const Icon(Icons.dashboard_outlined),
            ),
            title: const Text('Dashboard '),
          ),
          ListTile(
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile( firstName:widget.firstName, ),
                    ));
              },
              icon: const Icon(Icons.person),
            ),
            title: const Text('Personal Info '),
          ),
        ]),
      ),

      // body where my tasks will appear
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 16, 8, 0),
        child: TasksList(tasks),
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
