import 'package:plotrol/model/response/autentication_response/autentication_response.dart';
import 'package:plotrol/model/response/get_tenant_details/get_details_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../helper/api_constants.dart';
import '../../provider/Tenant_Details/get_tenant_provider.dart';

class GetTenantRepository {

  GetTenantProvider getTenantProvider = GetTenantProvider();

  String? tenantId;
  String? uuid;

  Future<UserSearchResponse?> getTenant() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    tenantId = prefs.getString('tenantId');
    uuid = prefs.getString('userUuid');
    return await getTenantProvider.getTenant('${ApiConstants.getTenant}', {
      "tenantId" : tenantId,
      "uuid": [uuid],
    });

  }
}