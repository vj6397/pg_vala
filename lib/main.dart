import 'dart:async';
import 'package:pg_vala/landlord/landlord.dart';
import 'package:pg_vala/landlord/paymentStatus.dart';
import 'package:pg_vala/landlord/paymentStatusTile.dart';
import 'landlord/bookingPage.dart';
import 'utils/location_list.dart';
import 'package:flutter/material.dart';
import 'package:pg_vala/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Navigate/navigate.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(primarySwatch: Colors.green),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getLoggedInState() async {
    var shr=await SharedPreferences.getInstance();
    var userIsLoggedIn=shr.getBool(keyVal);
    Timer(
      Duration(seconds: 2),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => userIsLoggedIn != null
                ? userIsLoggedIn
                ? NavigationScreen(currIndx: 0)
                : Login()
                : Login()),
      ),
    );
  }
  Future<void> get_token() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ktoken=prefs.getString('token');
  }
  @override
  initState(){
    super.initState();
    getLoggedInState();
    get_token();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared Preferences",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:bookingPage(),
//     );
//   }
// }