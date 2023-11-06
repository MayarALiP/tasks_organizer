import 'package:flutter/material.dart';
import 'package:tasks_organizer/splash_screen.dart';
import 'package:tasks_organizer/view/home_screen.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal[400],
        //useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/tasks': (context) => MyTasksHome(String as String),
      } ,

    );
  }
}
