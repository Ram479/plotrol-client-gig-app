import 'package:plotrol/data/provider/autentication/login_provider.dart';
import 'package:plotrol/model/response/employee_response/employee_search_response.dart';
import 'package:plotrol/model/response/individual/individual_response.dart';

import '../../../helper/api_constants.dart';
import '../../../model/request/autentication_request/autentication_request.dart';
import '../../../model/response/autentication_response/autentication_response.dart';

class LoginRepository {

  LoginProvider loginProvider = LoginProvider();

  Future<LoginResponse?> signIn(LoginRequest data) async {

    return await loginProvider.signIn(ApiConstants.login,data);
  }

  Future<IndividualsResponse?> getIndividual(Object? body, Map? userRequest) async {

    return await loginProvider.getIndividuals(ApiConstants.individualSearch, body, userRequest);
  }

  Future<OTPResponse?> sendOTP(Object? body,) async {

    return await loginProvider.sendOTP(ApiConstants.sendOtp, body, );
  }
  Future<EmployeeResponse?> createRequester(Object? body,) async {

    return await loginProvider.createRequester(ApiConstants.createRequester, body, );
  }
}