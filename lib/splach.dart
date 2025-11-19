import 'dart:async';

import 'package:flutter/material.dart';

class Splach extends StatefulWidget {
  Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  bool toGo = false;

  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.red),
      child: Icon(Icons.play_circle_fill_outlined, size: 100),
    );
  }
}
