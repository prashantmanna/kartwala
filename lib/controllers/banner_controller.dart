import 'dart:convert';

import 'package:kartwala/global_variables.dart';
import 'package:kartwala/models/banner_model.dart';
import 'package:http/http.dart' as http;

class BannerController {
  //fetch banners
  Future<List<BannerModel>> getBanners() async {
    try {
      //http request for getting banners
      http.Response response = await http.get(
        Uri.parse("$URI/banners"),
        headers: <String, String>{
          "Content-type": "application/json;charset=UTF-8",
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data["banners"] as List)
            .map((item) => BannerModel.fromJson(item))
            .toList();
      } else {
        //throw exception
        throw Exception("Failed to load banners");
      }
    } catch (e) {
      print(e);
      throw Exception("Error loading banners $e");
    }
  }
}
