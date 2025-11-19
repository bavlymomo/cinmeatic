import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Login", style: TextStyle(fontSize: 30)),
        Form(child: TextFormField()),
      ],
    );
  }
}
