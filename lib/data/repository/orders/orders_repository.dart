import 'package:plotrol/helper/api_constants.dart';
import 'package:plotrol/model/response/orders/get_orders_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/response/book_service/pgr_create_response.dart';
import '../../provider/orders/orders_provider.dart';

class GetOrdersRepository {

  GetOrderProvider getOrderProvider = GetOrderProvider();

  String? tenantId;

  Future<PgrServiceResponse?> getOrders(Map<String, dynamic>? queryParams) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tenantId = prefs.getString('tenantId');
    return await getOrderProvider.getOrders(ApiConstants.getOrders, queryParams);
  }
}