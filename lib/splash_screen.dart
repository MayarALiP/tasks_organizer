import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tasks_organizer/model/task.dart';
import 'package:tasks_organizer/view/login_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  List<Task> tasks =[
    Task(name:"design you dashboard"),
    Task(name:"design you profile "),
    Task(name:"delete a task "),
  ];

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
          () => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const LogInScreen (),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset("assets/images/splash.webp"),
    );
  }
}
