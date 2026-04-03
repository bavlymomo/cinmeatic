import 'package:cinmeatic/Presentations/Screens/download.dart';
import 'package:cinmeatic/core/theme_app.dart';
import 'package:cinmeatic/presentations/controllers/cubit/movies_cubit.dart';
import 'package:cinmeatic/presentations/screens/details.dart';
import 'package:cinmeatic/presentations/screens/home_page.dart';
import 'package:cinmeatic/presentations/screens/login.dart';
import 'package:cinmeatic/presentations/screens/see_all.dart';
import 'package:cinmeatic/presentations/screens/splach.dart';
import 'package:cinmeatic/presentations/screens/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => MoviesCubit()..fetchMovies(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp().themeData,
      home: const Splach(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const Login(),
        '/navigation': (context) => const NavigationPage(),
        '/details': (context) => const Details(),
        '/downloads': (context) => const Download(),
        '/see-all': (context) => const SeeAll(),
      },
    );
  }
}
