import 'get_properties_response.dart';

class HouseholdCreateResponse {
  Household? household;

  HouseholdCreateResponse({this.household});

  HouseholdCreateResponse.fromJson(Map<String, dynamic> json) {
    household = json['Household'] != null ? Household.fromJson(json['Household']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (household != null) {
      data['Household'] = household!.toJson();
    }
    return data;
  }
}
