import 'package:plotrol/data/provider/adding_properties/adding_properties_provider.dart';
import 'package:plotrol/model/request/adding_properties_request/adding_properties_request.dart';
import 'package:plotrol/model/response/adding_properties/adding_properties_response.dart';

import '../../../helper/api_constants.dart';
import '../../../model/response/adding_properties/get_properties_response.dart';

class AddPropertiesRepository {

  AddingPropertiesProvider addingPropertiesProvider = AddingPropertiesProvider();

  Future<HouseholdCreateResponse?> addProperties(Household household) async {

    return await addingPropertiesProvider.addProperties(ApiConstants.addProperties , {
      "Household": household
    });
  }
}