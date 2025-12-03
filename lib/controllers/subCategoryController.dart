import 'dart:convert';
import 'package:kartwala/global_variables.dart';
import 'package:kartwala/models/subcategorymodel.dart';
import 'package:http/http.dart' as http;

class Subcategorycontroller {
  Future<List<Subcategorymodel>> getSubCategoriesByName(
    String categoryName,
  ) async {
    try {
      final response = await http.get(
        Uri.parse("$URI/category/$categoryName/subcategories"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );

      print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);

        // Case 1: API returns a list
        if (decoded is List) {
          return decoded
              .map((item) => Subcategorymodel.fromJson(item))
              .toList();
        }

        // Case 2: API returns a map with "data" list
        if (decoded is Map &&
            decoded.containsKey("data") &&
            decoded["data"] is List) {
          return (decoded["data"] as List)
              .map((item) => Subcategorymodel.fromJson(item))
              .toList();
        }

        // Case 3: API returns a single object (map)
        if (decoded is Map) {
          return [
            Subcategorymodel.fromJson(Map<String, dynamic>.from(decoded)),
          ];
        }

        print("Unknown API response format");
        return [];
      } else {
        print("Request failed with status ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Error :- $e");
      return [];
    }
  }
}
