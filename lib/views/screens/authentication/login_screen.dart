import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Your Account",
                style: GoogleFonts.getFont(
                  "Lato",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                  fontSize: 23,
                ),
              ),
              Text(
                "To Explore The World Exclusives",
                style: GoogleFonts.getFont(
                  "Lato",
                  letterSpacing: 0.2,
                  fontSize: 14,
                ),
              ),
              Image.asset(
                "assets/images/Illustration.png",
                height: 200,
                width: 200,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: GoogleFonts.getFont(
                    "Nunito Sans",
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabled: true,
                  filled: true,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: "Enter Your Email",
                  labelStyle: GoogleFonts.getFont(
                    "Nunito Sans",
                    letterSpacing: 0.1,
                    fontSize: 14,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/email.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Password",
                  style: GoogleFonts.getFont(
                    "Nunito Sans",
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabled: true,
                  filled: true,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: "Enter Your Email",
                  labelStyle: GoogleFonts.getFont(
                    "Nunito Sans",
                    letterSpacing: 0.1,
                    fontSize: 14,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/icons/password.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Color(0xff102DE1), Color(0xCC0D6EFF)],
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 278,
                      top: 19,
                      child: Opacity(opacity: 0.5, child: Container(
                        width: 60,
                        height: 60,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          border: Border.all(width: 12,color: Color(0xFF103D))))
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
