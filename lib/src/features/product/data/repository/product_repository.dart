import 'package:dio/dio.dart';
import 'package:iframe_desktop/src/features/product/data/models/product.dart';

import '../../../../app/constants/api_url.dart';
import '../models/product_catagory.dart';

class ProductRepository {
  final Dio _dio = Dio();

  Future<ProductCategoryModel?> getProductCategories(String type) async {
    try {
      final response = await _dio.get(
        'https://app.backend.brexa.ai${ApiUrl.productCategory}',
        queryParameters: {
          'type': type,
          'organisation': '75fb1b71-47c3-41c3-aa7c-fc2d702fac3f',
        },
      );

      if (response.statusCode == 200) {
        return ProductCategoryModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching product categories: $e');
      return null;
    }
  }

  Future<List<GetProduct>?> getProducts(String? categoryId) async {
    try {
      final queryParameters = {
        'organisation': '75fb1b71-47c3-41c3-aa7c-fc2d702fac3f',
        'page': 1,
        'limit': 60,
        'type': '',
        if (categoryId != null) 'category_id': categoryId,
      };

      final response = await _dio.get(
        'https://app.backend.brexa.ai${ApiUrl.products}',
        queryParameters: queryParameters,
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;

        // print('API Response: $jsonData');

        if (jsonData != null &&
            jsonData['data'] != null &&
            jsonData['data'] is List) {
          final productList = jsonData['data'] as List;
          return productList.map((json) => GetProduct.fromJson(json)).toList();
        } else {
          print('Data list is null or not a list.');
          return [];
        }
      }
    } catch (e) {
      print('Error fetching products: ${e.toString()}');
    }
    return null;
  }
}
