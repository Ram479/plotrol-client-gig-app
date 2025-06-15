import 'dart:convert';
import 'package:http/http.dart';
import 'package:plotrol/model/response/orders/get_orders_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Helper/Logger.dart';
import '../../../model/request/autentication_request/request_info.dart';
import '../../../model/response/book_service/pgr_create_response.dart';
import '../../../model/response/employee_response/employee_search_response.dart';
import '../../../services/base-service.dart';

class GetAssigneesProvider {

  Future<EmployeeResponse?> getEmployees(
      {required String urlData, Map<String, dynamic>? queryParams, Object? body }) async {
    EmployeeResponse? getOrders;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('access_token');
    String? tenantId = prefs.getString('tenantId');
    String? userInfoString = prefs.getString('userInfo');
    Map? userInfo = userInfoString != null ? jsonDecode(userInfoString) : null;
    try {
      final requestInfo = RequestInfo(authToken: accessToken, userInfo: userInfo);

      final BaseService baseService = BaseService();


      final response = await baseService.makeRequest(url: urlData,
          body: {},
          queryParameters: {
            "tenantId": tenantId,
            ...?queryParams,
          },
          method: RequestType.POST,
          requestInfo: requestInfo
      );

      Map<String, dynamic> parsedJson = response;

      getOrders = EmployeeResponse.fromJson(parsedJson);
    } catch (e) {
      print(e.toString());
      print("errror ${e}");
    }
    return getOrders;
  }
}