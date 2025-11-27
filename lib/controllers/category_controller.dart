import 'dart:convert';

import 'package:kartwala/global_variables.dart';

import '../models/category.dart';
import 'package:http/http.dart' as http;

class CategoryController {
  //get categories
  Future<List<Category>> loadCatogaries() async {
    try {
      http.Response response = await http.get(
        Uri.parse("$URI/categories"),
        headers: <String, String>{
          "Content-type": "application/json;charset=UTF-8",
        },
      );

      print(response.body);

      print('Response Status Code: ${response.statusCode}'); // <-- ADD THIS
      print('Response Body: ${response.body}'); // <-- ADD THIS
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        List<Category> categories = data
            .map((categories) => Category.fromJson(categories))
            .toList();

        return categories;
      } else {
        throw Exception("Failed to load categories");
      }
    } catch (e) {
      print(e);
      throw Exception("Error loading categories $e");
    }
  }
}
