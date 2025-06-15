import 'package:plotrol/data/provider/add_individual/add_individual_provider.dart';

import '../../../helper/api_constants.dart';
import '../../../model/response/individual/individual_response.dart';
import '../../../model/response/individual/inidividual_create_response.dart';

class AddIndividualRepository {

  AddingIndividualProvider addingIndividualProvider = AddingIndividualProvider();

  Future<IndividualCreateResponse?> addIndividual(Individual individual) async {

    return await addingIndividualProvider.addIndividual(ApiConstants.addIndividual , {
      "Individual": individual
    });
  }
}