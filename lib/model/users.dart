class User {
  final String username;
  final String password;
  final String email;
  final int age ;
  final String meal ;
  final String location ;

  User(this.username, this.password, this.email, this.age, this.meal, this.location);
}

// list of registered users
final List<User> registeredUsers = [
  User('MayarAli'  ,  '123456'  , 'Mayar@Ali.com'  , 30 , 'Pizza' , "Canada"),
  User('SarraaALi' ,  '654321'  , 'Sarraa@Ali.com' , 24 , 'Shawerma',"Japan"),
  User('AhmedMeg'  ,  '10203040', 'Ahmed@Meg.com'  , 40  , 'fish', "USA")
];

bool isRegistered(User user) {
  for (User registeredUser in registeredUsers) {
    if (user.username == registeredUser.username) {
      return true; // The user is already registered
    }
  }
  return false;
}

Future<bool> authenticateUser(
    String username, String password, String email) async {
  for (User user in registeredUsers) {
    if (user.username == username &&
        user.password == password &&
        user.email == email) {
      return true;
      // Authentication successful
    }
  }

  return false;
  // Authentication failed
}

/*
import 'package:shared_preferences/shared_preferences.dart';
  class User {
  final String username;
  final String password;
  final String email;

  User(this.username, this.password, this.email);


// list of registered users
  static List<User> registeredUsers = [
    User('MayarAli', '123456', 'Mayar@Ali.com'),
    User('SarraaALi', '654321', 'Sarraa@Ali.com'),
    User('AhmedMeg', '10203040', 'ahmed@meg.com')
  ];

  static void addNewUser(User user) {
    registeredUsers.add(user);
  }

static User? authenticateUserWithSharedPreferences(SharedPreferences prefs) {
  String? savedUsername = prefs.getString('username');
  String? savedPassword = prefs.getString('password');
  String? savedEmail = prefs.getString('email');


  for (User user in registeredUsers) {
    if (user.username == savedUsername && user.password ==
        savedPassword && user.email == savedEmail) {
      return user;
      // Authentication successful
    }
  }

  return null;
  // Authentication failed
}
*/
