import 'household_member_response.dart';

class HouseholdMemberCreateResponse {
  HouseholdMember? householdMember;

  HouseholdMemberCreateResponse({this.householdMember});

  HouseholdMemberCreateResponse.fromJson(Map<String, dynamic> json) {
    householdMember = json['HouseholdMember'] != null ? HouseholdMember.fromJson(json['HouseholdMember']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (householdMember != null) {
      data['HouseholdMember'] = householdMember!.toJson();
    }
    return data;
  }
}
