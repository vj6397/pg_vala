import 'package:flutter/material.dart';
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
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: widget.currIndx,
        onTap: (index) {
          setState(() {
            widget.currIndx = index;
          });
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'OwnerProfile'),
        ],
      ),
    );
  }
}