import 'package:plotrol/data/provider/create_account/create_account_provider.dart';
import 'package:plotrol/model/request/create_account/create_account_request.dart';
import 'package:plotrol/model/response/create_account/create_account_response.dart';
import '../../../helper/api_constants.dart';


class CreateAccountRepository {

  CreateAccountProvider createAccountProvider = CreateAccountProvider();

  Future<CreateAccountResponse?> createNewUser(CreateAccountRequest data) async {

    return await createAccountProvider.createNewUser(ApiConstants.createAccount, data);
  }
}