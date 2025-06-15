import 'dart:convert';
import 'package:http/http.dart';
import 'package:plotrol/model/request/adding_properties_request/adding_properties_request.dart';
import 'package:plotrol/model/response/adding_properties/adding_properties_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Helper/Logger.dart';
import '../../../model/request/autentication_request/request_info.dart';
import '../../../services/base-service.dart';

class AddingPropertiesProvider {

  Future<HouseholdCreateResponse?> addProperties(String urlData, Object? body) async {
    HouseholdCreateResponse? addYourPropertiesResponse;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('access_token');
    String? tenantId = prefs.getString('tenantId');
    Map? userInfo = jsonDecode(prefs.getString('userInfo') ?? '');

    try {
      final requestInfo = RequestInfo(authToken: accessToken, userInfo: userInfo);

      final BaseService baseService = BaseService();


      final response = await baseService.makeRequest(url: urlData,
          body: body,
          method: RequestType.POST,
          requestInfo: requestInfo

      );
      Map<String, dynamic> parsedJson = response;

      addYourPropertiesResponse = HouseholdCreateResponse.fromJson(parsedJson);
      print('Add Your properties result ${response}');
    } catch (e) {
      print(e.toString());
      print("errror");
    }
    return addYourPropertiesResponse;
  }
}