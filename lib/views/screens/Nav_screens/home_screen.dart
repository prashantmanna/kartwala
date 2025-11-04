import 'package:flutter/material.dart';
import 'package:kartwala/views/screens/Nav_screens/Widgets/Header_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(children: [HeaderWidgets()])),
    );
  }
}
