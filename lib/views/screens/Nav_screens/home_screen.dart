import 'package:flutter/material.dart';
import 'package:kartwala/views/screens/Nav_screens/Widgets/Header_widgets.dart';
import 'package:kartwala/views/screens/Nav_screens/Widgets/banner_widget.dart';
import 'package:kartwala/views/screens/Nav_screens/Widgets/category_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidgets(),
            SizedBox(height: 5), // small fixed spacing
            BannerWidget(),
            SizedBox(height: 5), // small fixed spacing
            CategoryItemWidget(),
          ],
        ),
      ),
    );
  }
}
