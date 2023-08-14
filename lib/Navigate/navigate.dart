import 'package:flutter/material.dart';
import 'package:pg_vala/landlord/bookingPage.dart';
import 'package:pg_vala/landlord/paymentStatusTile.dart';
import '../landlord/landlord.dart';
import '../ownerPage/ownerProfile.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({required this.currIndx});
  int currIndx;

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}
List<Widget> screens = [
  Landlord(),
  bookingPage(),
  paymentStatusTile(),
  OwnerProfile(),
];

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currIndx,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Color.fromARGB(255, 255, 48, 68),
        currentIndex: widget.currIndx,
        onTap: (index) {
          setState(() {
            widget.currIndx = index;
          });
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined),label: 'Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.payment),label: 'Transactions'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'OwnerProfile'),
        ],
      ),
    );
  }
}