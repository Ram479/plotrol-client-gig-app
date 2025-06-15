import 'package:plotrol/data/provider/categories/get_categories_provider.dart';
import 'package:plotrol/helper/api_constants.dart';

import '../../../model/response/categories/get_categories.dart';


class GetCategoriesRepository {

  CategoriesProvider  categoriesProvider = CategoriesProvider();

  Future<CategoriesResponse?> getCategories() async {

    return await categoriesProvider.getCategories(ApiConstants.getCategories);
  }
}