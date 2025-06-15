import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../model/request/autentication_request/request_info.dart';
import '../../../model/response/individual/inidividual_create_response.dart';
import '../../../services/base-service.dart';

class AddingIndividualProvider {

  Future<IndividualCreateResponse?> addIndividual(String urlData, Object? body) async {
    IndividualCreateResponse? addIndividualResponse;

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

      addIndividualResponse = IndividualCreateResponse.fromJson(parsedJson);
      print('Add Your individual result ${response}');
    } catch (e) {
      print(e.toString());
      print("errror");
    }
    return addIndividualResponse;
  }
}