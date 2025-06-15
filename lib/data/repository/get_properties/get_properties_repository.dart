import 'package:plotrol/data/provider/get_properties/get_properties_provider.dart';
import 'package:plotrol/helper/api_constants.dart';
import 'package:plotrol/model/response/adding_properties/get_properties_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetPropertiesRepository {

  GetPropertiesProvider getPropertiesProvider = GetPropertiesProvider();

  String? tenantId;
  List<String>? householdHeadId;

  Future<HouseholdsResponse?> getProperties(List<String>? householdClientIds ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tenantId = prefs.getString('tenantId');
    return await getPropertiesProvider.getProperties('${ApiConstants.getProperties}', {
      "Household": {
        "clientReferenceId": householdClientIds,
        "tenantId": tenantId
      }
    });
  }
}