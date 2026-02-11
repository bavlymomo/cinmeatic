import 'package:cinmeatic/presentations/Screens/download.dart';
import 'package:cinmeatic/presentations/Screens/home_page.dart';
import 'package:cinmeatic/presentations/Screens/profile.dart';
import 'package:cinmeatic/presentations/Screens/save.dart';
import 'package:cinmeatic/presentations/Screens/search.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<dynamic> _pages = const [
    HomePage(),
    Search(),
    Save(),
    Download(),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Save",
              icon: Icon(Icons.save),
            ),
            BottomNavigationBarItem(
              label: "Download",
              icon: Icon(Icons.download),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ],
          backgroundColor: const Color(0xff1E1C33),
          // enableFeedback: true,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          selectedLabelStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
        ),
        body: _pages[_selectedIndex]);
  }
}
