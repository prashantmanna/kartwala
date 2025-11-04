import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kartwala/global_variables.dart';
import 'package:kartwala/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:kartwala/services/manage_http_response.dart';
import 'package:kartwala/views/screens/Nav_screens/MainScreen.dart';
import 'package:kartwala/views/screens/authentication/login_screen.dart';

class authController {
  Future<void> signUpUsers({
    required BuildContext context,
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: " ",
        fullName: fullName,
        email: email,
        password: password,
        state: " ",
        city: " ",
        locality: " ",
        token: "",
      );

      http.Response res = await http.post(
        Uri.parse("$URI/signup"),
        body: user.toJSON(),
        headers: <String, String>{
          //request headers
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      manageHttpResponse(
        response: res,
        context: context,
        onSuccess: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
          showSnackBar(
            context,
            "Account created successfully! Login to continue.",
          );
        },
      );
    } catch (e) {}
  }

  //signiin user
  Future<void> SignInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse("$URI/signin"),
        body: jsonEncode({"email": email, "password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      manageHttpResponse(
        response: response,
        context: context,
        onSuccess: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
            (route) => false,
          );
          showSnackBar(context, "Login Sucessfull !!!!");
        },
      );
    } catch (e) {
      print("Error : $e");
    }
  }
}
