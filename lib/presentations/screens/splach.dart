import 'dart:async';

import 'package:flutter/material.dart';

class Splach extends StatefulWidget {
  const Splach({super.key});

  @override
  State<Splach> createState() => _SplachState();
}

class _SplachState extends State<Splach> {
  bool toGo = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.red),
      child: const Icon(Icons.play_circle_fill_outlined, size: 100),
    );
  }
}
