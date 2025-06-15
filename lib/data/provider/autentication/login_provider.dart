import 'dart:convert';
import 'dart:io';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:http/http.dart';
import 'package:plotrol/helper/api_constants.dart';
import 'package:plotrol/model/response/employee_response/employee_search_response.dart';
import 'package:plotrol/model/response/individual/individual_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../helper/Logger.dart';
import '../../../model/request/autentication_request/autentication_request.dart';
import '../../../model/request/autentication_request/request_info.dart';
import '../../../model/response/autentication_response/autentication_response.dart';
import '../../../services/base-service.dart';

class LoginProvider {

  Future<LoginResponse?> signIn(String urldata, LoginRequest data) async {
    LoginResponse? loginResponse;

    try {

      final headers = {
        HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded',
        "Access-Control-Allow-Origin": "*",
        "authorization": "Basic ZWdvdi11c2VyLWNsaWVudDo=",
      };

      // // Convert JSON to a URL-encoded string
      // final Map<String, String> formData = data.toJson().map((key, value) =>
      //     MapEntry(key, value.toString()));
      final body = {
        "username": data.username,
        "password": data.password,
        "grant_type": "password",
        "scope": "read",
        "tenantId": "mz",
        "userType": "EMPLOYEE"
      };

      final encodedBody = body.entries.map((e) => "${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value.toString())}").join("&");
      final url = Uri.parse(urldata);
      final response = await post(url,
          body: encodedBody,
          headers: headers
      );
       logger.i("signInDataBody ${json.encode(data)}");
       logger.i("responseeeeeedata ${response.body}");

      Map<String, dynamic> parsedJson = json.decode(response.body.toString());

      loginResponse = LoginResponse.fromJson(parsedJson);
      print('provider result$loginResponse');
    } catch (e) {
      print(e.toString());
      print("errror");
    }
    return loginResponse;
  }

  Future<IndividualsResponse?> getIndividuals(String urlData, Object? body, Map? userRequest) async {
    IndividualsResponse? getIndividuals;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('access_token');
    String? tenantId = prefs.getString('tenantId');
    String? userInfoString = prefs.getString('userInfo');
    Map? userInfo = userRequest != null ? userRequest : userInfoString != null ? jsonDecode(userInfoString) : null;
    try {
      final requestInfo = RequestInfo(authToken: accessToken, userInfo: userInfo);

      final BaseService baseService = BaseService();


      final response = await baseService.makeRequest(url: urlData,
          body: body,
          queryParameters: {
            "offset": "0",
            "limit": "200",
            "tenantId": (tenantId?.trim() ?? "").isNotEmpty ? tenantId : "mz",
          },
          method: RequestType.POST,
          requestInfo: requestInfo

      );

      Map<String, dynamic> parsedJson = response;

      getIndividuals = IndividualsResponse.fromJson(parsedJson);
      print('Add Individual Logged In $getIndividuals');
    } catch (e) {
      print(e.toString());
      print("errror ${e}");
    }
    return getIndividuals;
  }

  Future<EmployeeResponse?> createRequester(String urlData, Object? body,) async {
    EmployeeResponse? createResponse;

    try {
      final requestInfo = RequestInfo(
        userInfo: {
          "id": 15
        }
      );

      final BaseService baseService = BaseService();


      final response = await baseService.makeRequest(url: urlData,
          body: body,
          queryParameters: {
            "tenantId": "mz",
          },
          method: RequestType.POST,
          requestInfo: requestInfo

      );
      Map<String, dynamic> parsedJson = response;

      createResponse = EmployeeResponse.fromJson(parsedJson);
    } catch (e) {
      print(e.toString());
      print("errror ${e}");
    }
    return createResponse;
  }

  Future<OTPResponse?> sendOTP(String urlData, Object? body,) async {
    OTPResponse? otpResponse;

    try {
      final requestInfo = RequestInfo();

      final BaseService baseService = BaseService();


      final response = await baseService.makeRequest(url: urlData,
          body: body,
          queryParameters: {
            "tenantId": "mz",
          },
          method: RequestType.POST,
          requestInfo: requestInfo

      );

      Map<String, dynamic> parsedJson = response;

      otpResponse = OTPResponse.fromJson(parsedJson);
    } catch (e) {
      print(e.toString());
      print("errror ${e}");
    }
    return otpResponse;
  }
}






