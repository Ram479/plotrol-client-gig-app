import 'package:plotrol/model/response/edit_profile/edit_profile_response.dart';
import '../../../helper/api_constants.dart';
import '../../../model/request/edit_profile/edit_profile_request.dart';
import '../../provider/edit_profile/edit_profile_provider.dart';

class EditProfileRepository {

  EditProfileProvider editProfileProvider = EditProfileProvider();

  Future<EditProfileResponse?> editTenant(EditProfileRequest data) async {

    return await editProfileProvider.editTenant(ApiConstants.editProfile ,data);
  }
}