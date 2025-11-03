import 'package:flutter/material.dart';
import 'package:kartwala/global_variables.dart';
import 'package:kartwala/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:kartwala/services/manage_http_response.dart';

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
          showSnackBar(
            context,
            "Account created successfully! Login to continue.",
          );
        },
      );
    } catch (e) {}
  }
}
