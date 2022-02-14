import 'package:flutter/material.dart';
import 'package:portfolio/Src/HomeScreen.dart';

void main(List<String> args) {
  runApp(Routing());
}

class Routing extends StatelessWidget {
  const Routing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
