import 'dart:convert';
import 'package:http/http.dart';
import 'package:plotrol/model/response/autentication_response/autentication_response.dart';
import 'package:plotrol/model/response/get_tenant_details/get_details_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Helper/Logger.dart';
import '../../../model/request/autentication_request/request_info.dart';
import '../../../services/base-service.dart';

class GetTenantProvider {

  Future<UserSearchResponse?> getTenant(String urlData, Object? body) async {
    UserSearchResponse? getTenantDetails;

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
            "tenantId": tenantId,
          },
          method: RequestType.POST,
          requestInfo: requestInfo

      );
      logger.i("addYourProperties Response Data ${response}");

      Map<String, dynamic> parsedJson = response;

      getTenantDetails = UserSearchResponse.fromJson(parsedJson);
    } catch (e) {
      print(e.toString());
      print("errror ${e}");
    }
    return getTenantDetails;
  }
}