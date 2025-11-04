import 'package:flutter/material.dart';
import 'package:kartwala/views/screens/Nav_screens/MainScreen.dart';
import 'package:kartwala/views/screens/authentication/login_screen.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen(), debugShowCheckedModeBanner: false);
  }
}
