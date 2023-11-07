import 'package:flutter/material.dart';
import 'package:tasks_organizer/model/task.dart';
import 'package:tasks_organizer/my_costume_widgets/dashboard_cards.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  final List<Task> tasks;
  String firstName;

   DashboardScreen(this.tasks, { required this.firstName,super.key});

  @override
  Widget build(BuildContext context) {
    int totalTasks = tasks.length;
    int doneTasks = tasks.where((task) => task.isDone).length;
    int remainTasks = totalTasks - doneTasks;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        title:  Text("$firstName's DashBoard"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildStatCard(
                title: "Your List has",
                value: "$totalTasks Tasks",
              ),
              buildStatCard(
                title: "Your have done",
                value: "$doneTasks Tasks",
              ),
              buildStatCard(
                title: "Your still have",
                value: "$remainTasks Tasks",
              ),
            ]),
      ),
    );
  }
}
