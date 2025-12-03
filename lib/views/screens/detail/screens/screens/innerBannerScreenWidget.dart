import 'package:flutter/material.dart';

class Innerbannerscreenwidget extends StatelessWidget {
  final String image;

  const Innerbannerscreenwidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
