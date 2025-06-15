import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Helper/Logger.dart';


class GooglePlacesService {

  String? latitude;
  String? longitude;
  String? city;
  int? radius;

  GooglePlacesService();

  // Future<List<Map<String, dynamic>>> getPlacesPredictions(String input) async {
  //   final url = Uri.parse(
  //       'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=AIzaSyCF4KatYCI3vqz1_H3kiHeyS3yCMfYToh8');
  //
  //   final response = await http.get(url);
  //
  //   if (response.statusCode == 200) {
  //     final predictions = json.decode(response.body)['predictions'];
  //     return List<Map<String, dynamic>>.from(predictions);
  //   } else {
  //     throw Exception('Failed to load predictions');
  //   }
  // }

  Future<List<Map<String, dynamic>>> getPlacesPredictions(String input) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // latitude = prefs.getString('appLatitude');
    // longitude = prefs.getString('appLongitude');
    // city = prefs.getString('appLocation');
    // radius = prefs.getInt('appRadius');
    // logger.i(city);
    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&components=country:IN&key=AIzaSyCF4KatYCI3vqz1_H3kiHeyS3yCMfYToh8');
      //   'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input$city&location=$latitude,$longitude&radius=15000&bounds=$latitude,$longitude&components=country:IN&types=establishment&key=AIzaSyCF4KatYCI3vqz1_H3kiHeyS3yCMfYToh8');
    logger.i(url);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final predictions = data['predictions'] as List<dynamic>;
      return predictions.map((prediction) => prediction as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load autocomplete suggestions');
    }
  }

  Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyCF4KatYCI3vqz1_H3kiHeyS3yCMfYToh8');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final details = json.decode(response.body)['result'];
      return Map<String, dynamic>.from(details);
    } else {
      throw Exception('Failed to load place details');
    }
  }

  Future<double> getDistance(double pickupLat, double pickupLong, double dropLat, double dropLong) async {
    const apiKey = 'AIzaSyDQ2c_pOSOFYSjxGMwkFvCVWKjYOM9siow';
    final url =
        'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$pickupLat,$pickupLong&destinations=$dropLat,$dropLong&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final distanceText = data['rows'][0]['elements'][0]['distance']['text'];
      final distanceValue = data['rows'][0]['elements'][0]['distance']['value'] / 1000; // Convert meters to kilometers
      print('Distance: $distanceText');
      return distanceValue;
    } else {
      throw Exception('Failed to load distance');
    }
  }

}


