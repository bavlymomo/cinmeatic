import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/screens/home_page.dart';
import 'package:cinmeatic/presentations/screens/login.dart';
import 'package:cinmeatic/presentations/screens/splach.dart';
import 'package:cinmeatic/presentations/screens/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => MoviesCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff06041F),
          textTheme: const TextTheme(
              headlineMedium: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              bodySmall: TextStyle(fontSize: 12, color: Colors.grey),
              labelSmall: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 14), 
               
                  )),
      home: const Splach(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const Login(),
        '/navigation': (context) => const NavigationPage(),
      },
    );
  }
}
