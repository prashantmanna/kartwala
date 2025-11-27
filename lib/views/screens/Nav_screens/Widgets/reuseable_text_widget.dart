import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReuseableTextWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const ReuseableTextWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            subTitle,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
