import 'dart:convert';
import 'package:http/http.dart';
import 'package:plotrol/model/request/edit_profile/edit_profile_request.dart';
import 'package:plotrol/model/response/edit_profile/edit_profile_response.dart';
import '../../../Helper/Logger.dart';

class EditProfileProvider {

  Future<EditProfileResponse?> editTenant(String urlData, EditProfileRequest data) async {
    EditProfileResponse? editProfileResponse;
    try {
      final url = Uri.parse(urlData);
      print('Urlforupdate : ${url}');
      final response = await put(url,
          body: json.encode(data),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            // 'Authorization': '$token',
          }
      );
      logger.i("editProfile ${json.encode(data)}");
      logger.i("edit Response ${response.body}");

      Map<String, dynamic> parsedJson = json.decode(response.body.toString());

      editProfileResponse = EditProfileResponse.fromJson(parsedJson);
      logger.i('edit Result : $editProfileResponse');
    } catch (e) {
      logger.i(e.toString());
      logger.i("error");
    }
    return editProfileResponse;
  }
}