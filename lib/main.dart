
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_samples/screens/login_page.dart';
import 'package:flutterfire_samples/screens/login_screen.dart';
import 'package:flutterfire_samples/utils/database.dart';

import 'Dropdown/customdropdown.dart';
import 'HomeScreen/home_design_course.dart';
import 'navigation_home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    User? user = FirebaseAuth.instance.currentUser;
    print(user);
    // print(user!.email);

    Widget scrrentobe = LoginPage();
      if(user == null){
        scrrentobe = LoginPage();
      }else{
        Database.userUid = user.email;
        scrrentobe = NavigationHomeScreen(user: user,);
      }

    return MaterialApp(
      title: 'VehiBrain',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: scrrentobe, //LoginScreen LoginPage
    );
  }
}