import 'package:dio/dio.dart';
import 'package:product_list_demo/models/product.dart';

class ProductApi {
  final Dio _dio = Dio();
  final String baseUrl = 'https://dummyjson.com/products/search';

  Future<ProductResponse> searchProducts({required String query, required int page, int limit = 20}) async {
    final skip = page * limit;
    final uri = '$baseUrl?q=$query&limit=$limit&skip=$skip';

    try {
      final response = await _dio.get(uri);
      if (response.statusCode == 200) {
        var data = ProductResponse.fromJson(response.data);
        return data;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
