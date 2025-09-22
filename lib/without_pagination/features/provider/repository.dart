import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../bloc/api_result.dart';
import '../../core/data/dio/dio_client.dart';
import '../../core/utils/network_exceptions.dart';
import '../model/categories.dart';
import '../model/products.dart';

class ShopRepository {
  late DioClient dioClient;
  final String baseUrl = dotenv.env["API_URL"]!;

  ShopRepository() {
    var dio = Dio();
    dioClient = DioClient(baseUrl,dio);
  }

  Future<ApiResult<List<Products>>> fetchProducts(int limit,) async {
    var url = "/products?limit=$limit";
    print("----------url--------$url");
    try {
      final response = await dioClient.get(url);
      print("----------response--------$response");

      List<dynamic> products = response['products'];
      print("----------products--------$products");

      List<Products> productList = products
          .map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList();

      print("----------productList--------$productList");
      return ApiResult.success(data: productList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  Future<ApiResult<List<Categories>>> fetchCategories() async {
    var url = "/products/categories";
    print("----------url--------$url");
    try {
      final response = await dioClient.get(url);
      print("----------response--------$response");

      List<dynamic> categoryListRaw = response;
      print("----------categoryListRaw--------$categoryListRaw");

      List<Categories> categoryList = categoryListRaw
          .map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList();

      print("----------productList--------$categoryList");
      return ApiResult.success(data: categoryList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<List<Products>>> subCategoriesProduct(String categorySlug) async {
    var url = "/products/category/$categorySlug";
    print("----------url--------$url");
    try{
      final response = await dioClient.get(url);
      print("----------response--------$response");

      List<dynamic> products = response['products'];
      print("----------products--------$products");

      List<Products> productList = products
          .map((e) => Products.fromJson(e as Map<String, dynamic>))
          .toList();

      return ApiResult.success(data: productList);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

}
