import 'package:plotrol/data/provider/autentication/login_provider.dart';
import 'package:plotrol/data/provider/get_properties/get_property_member_provider.dart';
import 'package:plotrol/model/response/household_member/household_member_response.dart';
import 'package:plotrol/model/response/individual/individual_response.dart';

import '../../../helper/api_constants.dart';
import '../../../model/request/autentication_request/autentication_request.dart';
import '../../../model/response/autentication_response/autentication_response.dart';

class GetHouseholdMemberRepository {

  GetHouseholdMemberProvider memberProvider = GetHouseholdMemberProvider();

  Future<HouseholdMembersResponse?> getHouseholdMember(Object? body) async {

    return await memberProvider.getHouseholdMember(ApiConstants.memberSearch, body);
  }
}