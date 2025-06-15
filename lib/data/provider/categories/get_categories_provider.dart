import 'dart:convert';

import 'package:http/http.dart';

import '../../../Helper/Logger.dart';
import '../../../model/response/categories/get_categories.dart';

class CategoriesProvider {

  Future<CategoriesResponse?> getCategories(String urlData) async {
    CategoriesResponse? categoriesResponse;

    try {
      final url = Uri.parse(urlData);
      logger.i('Url : $url');
      final response = await get(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': '$token',
          }
      );
      logger.i("addYourProperties Response Data ${response.body}");

      Map<String, dynamic> parsedJson = json.decode(response.body.toString());

      categoriesResponse = CategoriesResponse.fromJson(parsedJson);
      print('Add Your properties result $categoriesResponse');
    } catch (e) {
      print(e.toString());
      print("errror");
    }
    return categoriesResponse;
  }
}