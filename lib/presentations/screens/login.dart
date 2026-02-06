import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisable = false;
  String theEmail = "";
  final _formkey = GlobalKey<FormState>();
  String thePassword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Align(
        alignment: Alignment.center,
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login",
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      labelText: 'Email Adderess',
                      labelStyle: TextStyle(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field should be filled";
                    } else if (!value.contains('@')) {
                      return 'Field should contain @';
                    } else if (!value.contains('.com')) {
                      return "Field should contain '.com' ";
                    }
                  },
                  onSaved: (newValue) {
                    theEmail = newValue!;
                  },
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.grey),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisable = !isPasswordVisable;
                            });
                          },
                          icon: isPasswordVisable
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off))),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: !isPasswordVisable,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field should be filled";
                    } else if (value.length < 8) {
                      return "Password should be atleast 8";
                    } else if (!value.contains(RegExp(r'[A-Z]'))) {
                      return "Password should contain uppercase char";
                    } else if (!value.contains(RegExp(r'\d'))) {
                      return "Password should contain numbers";
                    }
                  },
                  onSaved: (newValue) {
                    thePassword = newValue!;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FilledButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                          }
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        )),
                    FilledButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/navigation');
                        },
                        child: const Text("Try it"))
                  ],
                )
              ],
            )),
      ),
    ));
  }
}
