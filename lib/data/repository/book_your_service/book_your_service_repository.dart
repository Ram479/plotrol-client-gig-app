import 'package:plotrol/model/request/book_service/book_service.dart';
import 'package:plotrol/model/response/book_service/book_service.dart';
import '../../../helper/api_constants.dart';
import '../../../model/response/book_service/pgr_create_response.dart';
import '../../provider/book_your_service/book_your_service_provider.dart';

class BookServiceRepository {

  BookServiceProvider  addYourPropertiesProvider = BookServiceProvider();

  Future<PgrServiceResponse?> bookService(ServiceWrapper data) async {

    return await addYourPropertiesProvider.bookService(ApiConstants.bookService ,{
      "service": data.service,
      "workflow": data.workflow,
    });
  }
  Future<PgrServiceResponse?> updateBooking(ServiceWrapper data) async {

    return await addYourPropertiesProvider.bookService(ApiConstants.updateService ,{
      "service": data.service,
      "workflow": data.workflow,
    });
  }
}