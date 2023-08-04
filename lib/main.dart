
import 'package:flutter/material.dart';
import 'package:pg_vala/landlord/landlord.dart';
import 'package:pg_vala/landlord/roomTile.dart';
import 'package:pg_vala/login/login.dart';
import 'package:pg_vala/login/otp_verification.dart';
import 'package:pg_vala/page/updatePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PG Vala',
      // initialRoute: '/home',
      // routes: {
      //   // '/login': (context) => const Login(),
      //   // '/home': (context) => const Home(),
      //   // '/search': (context) => const Search(),
      //   // '/Deliveryform': (context) => const PateintDetailsDelivery(),
      //   // '/TakeAwayform': (context) => const PateintDetailsTakeaway(),
      // },
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}



