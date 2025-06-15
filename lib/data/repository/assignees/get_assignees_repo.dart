import 'package:plotrol/data/provider/employees/get_assignees_provider.dart';
import 'package:plotrol/model/request/book_service/book_service.dart';
import 'package:plotrol/model/response/book_service/book_service.dart';
import 'package:plotrol/model/response/employee_response/employee_search_response.dart';
import '../../../helper/api_constants.dart';
import '../../../model/response/book_service/pgr_create_response.dart';
import '../../provider/book_your_service/book_your_service_provider.dart';

class GetAssigneesRepository {

  GetAssigneesProvider  getAssigneesProvider = GetAssigneesProvider();

  Future<EmployeeResponse?> getAssignees(Map<String, dynamic>? queryParams) async {

    return await getAssigneesProvider.getEmployees(
      urlData: ApiConstants.employeeSearch,
      queryParams: queryParams,
    );
  }
}