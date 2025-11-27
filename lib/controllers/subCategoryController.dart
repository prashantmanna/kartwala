import 'dart:convert';

import 'package:kartwala/global_variables.dart';
import 'package:kartwala/models/subcategorymodel.dart';
import 'package:http/http.dart' as http;

class Subcategorycontroller {
  Future<List<Subcategorymodel>> getSubCategoriesByName(
    String categoryName,
  ) async {
    try {
      http.Response response = await http.get(
        Uri.parse("$URI//category/$categoryName/subcategories"),
        headers: <String, String>{
          //request headers
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          return data
              .map((subCateogory) => Subcategorymodel.fromJson(subCateogory))
              .toList();
        } else {
          print("subcategories not found");
          return [];
        }
      } else if (response.statusCode == 404) {
        print("subcategories not found");
        return [];
      } else {
        print("failed to fetch subcategories");
        return [];
      }
    } catch (e) {
      print("Error :- $e");
      return [];
    }
  }
}
