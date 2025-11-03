import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void manageHttpResponse({
  required http.Response response, //HTTP response object
  required BuildContext context,
  required VoidCallback onSuccess, //Build context
}) {
  switch (response.statusCode) {
    case 200: //successfull request
      onSuccess();
      break;
    case 400:
      showSnackBar(context, json.decode(response.body)['msg']);
      break;
    case 500: //server error
      showSnackBar(context, json.decode(response.body)['error']);
      break;
    case 201: //resource was created successfully
      onSuccess();
      break;
  }
}

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
