// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks_organizer/model/users.dart';
import 'package:tasks_organizer/view/home_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool rememberMe = false;
  String errorMsg = "";

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      usernameController.text = prefs.getString('username') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', usernameController.text);
    prefs.setString('email', emailController.text);
    prefs.setBool('rememberMe', rememberMe);

    // If we entered a new User
    User newUser = User(
        usernameController.text, passwordController.text, emailController.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('User saved successfully.'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal[400],
        title: const Text(
          'Login Screen',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),


      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Error Handling الغلابة
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: SizedBox(
                  width: double.infinity,
                  height: double.tryParse(errorMsg),
                  // Adjust the height of this container based on the error message
                  child: Text(
                    errorMsg,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              // Username TextField
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: "Enter your User Name",
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.teal[500],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),

              // Password TextField
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: "Enter your Password",
                    icon: Icon(
                      Icons.lock,
                      color: Colors.teal[500],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),

              // Email TextField
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: "Enter your Email",
                    icon: Icon(
                      Icons.email,
                      color: Colors.teal[500],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),

              // Remember Me checkbox
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                child: Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                    const Text('Remember Me'),
                  ],
                ),
              ),

//ToDO _while testing _:go to model/user and pic from "registeredUsers" one copy & paste
              // Button
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.teal[400]),
                    ),
                    onPressed: () async {
                      // Remember Me
                      if (rememberMe) {
                        _saveData();
                      }

                      // Validate input
                      if (usernameController.text.isEmpty ||
                          !emailController.text.contains('@') ||
                          passwordController.text.isEmpty) {
                        // Handle empty fields with informative error messages
                        setState(() {
                          errorMsg = 'Please fill in all fields correctly.';
                        });
                        return;
                      }

                      // Authenticate the user
                      bool isAuthenticated = await authenticateUser(
                        usernameController.text,
                        passwordController.text,
                        emailController.text,
                      );

                      if (isAuthenticated) {
                        // Successful login, navigate to the next screen
                        print("Navigating to the next screen");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyTasksHome(usernameController.text),
                          ),
                        );

                      } else {
                        // Failed login, display an error message
                        setState(() {
                          errorMsg =
                              'Invalid email or password. Please try again.';
                        });
                      }
                    },
                    child: const Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







/*adding new user to the list in user model
// Check if the user already exists in the list of registered users
      User newUser = User(usernameController.text, passwordController.text, emailController.text);
      if (!User.isRegistered(newUser)) {
        User.addUser(newUser); // Add the new user to the list
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User saved successfully.'),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User already exists. Please log in.'),
        ));
*/
