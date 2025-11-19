import 'package:cinmeatic/home_page.dart';
import 'package:cinmeatic/login.dart';
import 'package:cinmeatic/splach.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splach(),
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => Login(),
      },
    );
  }
}
