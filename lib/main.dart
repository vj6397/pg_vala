import 'dart:async';
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

  @override
  void initState() {
    super.initState();
    getLoggedInState();
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