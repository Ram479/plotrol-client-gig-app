import 'dart:convert';
import 'dart:io';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:http/http.dart';
import 'package:plotrol/helper/api_constants.dart';
import 'package:plotrol/model/response/household_member/household_member_response.dart';
import 'package:plotrol/model/response/individual/individual_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../helper/Logger.dart';
import '../../../model/request/autentication_request/autentication_request.dart';
import '../../../model/request/autentication_request/request_info.dart';
import '../../../model/response/autentication_response/autentication_response.dart';
import '../../../services/base-service.dart';

class GetHouseholdMemberProvider {

  Future<HouseholdMembersResponse?> getHouseholdMember(String urlData, Object? body) async {
    HouseholdMembersResponse? getMembers;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? accessToken = prefs.getString('access_token');
      String? tenantId = prefs.getString('tenantId');
      Map? userInfo = jsonDecode(prefs.getString('userInfo') ?? '');

      final requestInfo = RequestInfo(authToken: accessToken, userInfo: userInfo);

      final BaseService baseService = BaseService();


      final response = await baseService.makeRequest(url: ApiConstants.memberSearch,
          body: body,
          queryParameters: {
            "offset": "0",
            "limit": "100",
            "tenantId": tenantId,
          },
          method: RequestType.POST,
          requestInfo: requestInfo

      );

      Map<String, dynamic> parsedJson = response;

      getMembers = HouseholdMembersResponse.fromJson(parsedJson);
      print('Add Your properties result $getMembers');
    } catch (e) {
      print(e.toString());
      print("errror ${e}");
    }
    return getMembers;
  }
}






