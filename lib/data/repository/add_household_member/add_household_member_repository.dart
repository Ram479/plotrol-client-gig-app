import 'package:plotrol/data/provider/add_household_member/add_household_member_provider.dart';
import 'package:plotrol/model/response/household_member/household_member_create_response.dart';
import 'package:plotrol/model/response/household_member/household_member_response.dart';

import '../../../helper/api_constants.dart';

class AddHouseholdMemberRepository {

  AddingHouseholdMemberProvider addingHouseholdMemberProvider = AddingHouseholdMemberProvider();

  Future<HouseholdMemberCreateResponse?> addHouseholdMember(HouseholdMember householdMember) async {

    return await addingHouseholdMemberProvider.addHouseholdMember(ApiConstants.addHouseholdMember , {
      "HouseholdMember": householdMember
    });
  }
}