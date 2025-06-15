import 'dart:convert';
import 'package:http/http.dart';
import 'package:plotrol/model/request/create_account/create_account_request.dart';
import 'package:plotrol/model/response/create_account/create_account_response.dart';
import '../../../Helper/Logger.dart';

class CreateAccountProvider {
  Future<CreateAccountResponse?> createNewUser(String urlData, CreateAccountRequest data) async {
    CreateAccountResponse? createAccountResponse;

    try {
      final url = Uri.parse(urlData);
      final response = await post(url,
          body: json.encode(data),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }
      );
      logger.i("CreateAccountBody ${json.encode(data)}");
      logger.i("CreateAccountBody ${json.encode(data.tenantlocations)}");
      logger.i("CreateAccountBody ${json.encode(data.tenantsubscriptions)}");
      logger.i("CreateAccountResponse ${response.body}");

      Map<String, dynamic> parsedJson = json.decode(response.body.toString());

      createAccountResponse = CreateAccountResponse.fromJson(parsedJson);
      logger.i('provider result $createAccountResponse');
    } catch (e) {
      logger.i(e.toString());
      logger.i("errror");
    }
    return createAccountResponse;
  }


}