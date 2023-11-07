import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String firstName;
  // final User userData;

  const Profile( {super.key, required this.firstName});

  //const Profile(this.userData,{super.key, required this.firstName});

  @override
  Widget build(BuildContext context) {
    // int uAge =userData.age;
    // String uLocation =userData.location;
    // String uMeal =userData.meal;


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        title: Text("$firstName's Profile"),
      ),
      body: Column(children: [
        Container(
          color: Colors.teal[600],
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            SizedBox(
              width: 150,
              height: 200,
              child: Image.asset(
                "assets/images/$firstName.webp",
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "  Hi again , $firstName",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ]),
        ),
        Container(
          color: Colors.blue[700],
          child: Row(
            children: [
              const SizedBox(
                width: 165,
                height: 150,
                child: Icon(Icons.back_hand_outlined,
                size: 60,
                ),
              ),
              Container(
                color: Colors.transparent,
                child: const Text(
                  "age : 30",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.teal[600],
          child: Row(
            children: [
              const SizedBox(
                width: 165,
                height: 150,
                child: Icon(Icons.location_on,
                size: 60,
                ),
              ),
              Container(
                color: Colors.transparent,
                child: const Text(
                  "Location : Egypt",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.blue[700],
          child: Row(
            children: [
              const SizedBox(
                width: 165,
                height: 150,
                child: Icon(Icons.icecream_outlined,
                  size: 60,
                ),
              ),
              Container(
                color: Colors.transparent,
                child: const Text(
                  "Favourite meal :\n  pizza",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),


      ]),
    );
  }
}
