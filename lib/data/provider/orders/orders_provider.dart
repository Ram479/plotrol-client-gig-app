import 'dart:convert';
import 'package:http/http.dart';
import 'package:plotrol/model/response/orders/get_orders_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Helper/Logger.dart';
import '../../../model/request/autentication_request/request_info.dart';
import '../../../model/response/book_service/pgr_create_response.dart';
import '../../../services/base-service.dart';

class GetOrderProvider {

  Future<PgrServiceResponse?> getOrders(String urlData, Map<String, dynamic>? queryParams) async {
    PgrServiceResponse? getOrders;

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
            "offset": "0",
            "limit": "200",
            "tenantId": tenantId,
            ...?queryParams,
          },
          method: RequestType.POST,
          requestInfo: requestInfo
      );

      Map<String, dynamic> parsedJson = response;

      getOrders = PgrServiceResponse.fromJson(parsedJson);
    } catch (e) {
      print(e.toString());
      print("errror ${e}");
    }
    return getOrders;
  }
}