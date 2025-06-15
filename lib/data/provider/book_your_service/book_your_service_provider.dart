import 'dart:convert';
import 'package:http/http.dart';
import 'package:plotrol/model/request/book_service/book_service.dart';
import 'package:plotrol/model/response/book_service/book_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Helper/Logger.dart';
import '../../../model/request/autentication_request/request_info.dart';
import '../../../model/response/book_service/pgr_create_response.dart';
import '../../../services/base-service.dart';

class BookServiceProvider {

  Future<PgrServiceResponse?> bookService(String urlData, Object? body) async {
    PgrServiceResponse? bookServiceResponse;

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

      bookServiceResponse = PgrServiceResponse.fromJson(parsedJson);
      print('Add Your individual result ${response}');
    } catch (e) {
      print(e.toString());
      print("errror");
    }
    return bookServiceResponse;
  }
}