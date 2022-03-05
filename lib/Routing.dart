import 'package:flutter/material.dart';
import 'package:portfolio/Src/CreateProfile/ProfileForm.dart';
import 'package:portfolio/Src/Home/HomeScreen.dart';
import 'package:portfolio/Src/Start/Start.dart';

class Routing extends StatefulWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  State<Routing> createState() => _RoutingState();
}

class _RoutingState extends State<Routing> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:
          '/', //this route is for entire navigating screen in the app we initialize it in here.
      routes: {
        '/': (context) => const Start(),
        '/home': (context) => const HomeScreen(),
        '/create': (context) => const ProfileForm(),
      },
    );
  }
}
