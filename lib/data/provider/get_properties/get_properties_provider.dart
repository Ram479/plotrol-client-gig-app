import 'dart:convert';
import 'package:http/http.dart';
import 'package:plotrol/services/base-service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Helper/Logger.dart';
import '../../../model/request/autentication_request/request_info.dart';
import '../../../model/response/adding_properties/get_properties_response.dart';

class GetPropertiesProvider {

  Future<HouseholdsResponse?> getProperties(String urlData, Object? body) async {
    HouseholdsResponse? getProperties;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('access_token');
    String? tenantId = prefs.getString('tenantId');
    Map? userInfo = jsonDecode(prefs.getString('userInfo') ?? '');

    try {
      final requestInfo = RequestInfo(authToken: accessToken, userInfo: userInfo);

      final BaseService baseService = BaseService();


      final response = await baseService.makeRequest(url: urlData,
          body: body,
          queryParameters: {
            "offset": "0",
            "limit": "100",
            "tenantId": tenantId,
          },
          method: RequestType.POST,
          requestInfo: requestInfo

      );
      logger.i("addYourProperties Response Data ${response}");

      Map<String, dynamic> parsedJson = response;

      getProperties = HouseholdsResponse.fromJson(parsedJson);
      print('Add Your properties result $getProperties');
    } catch (e) {
      print(e.toString());
      print("errror ${e}");
    }
    return getProperties;
  }
}