import 'package:dio/dio.dart';
import 'package:iframe_desktop/src/features/product/data/models/address.dart';
import 'package:iframe_desktop/src/features/product/data/models/cart.dart';
import 'package:iframe_desktop/src/features/product/data/models/product.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../../app/constants/api_url.dart';
import '../models/product_catagory.dart';

class ProductRepository {
  final Dio _dio = Dio();
  final String accessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI1MTc5NzIwLCJpYXQiOjE3MjQ5MjA1MjAsImp0aSI6ImY1NTlhZGU2MjAxZjQyYWI5N2FkZjkwMTZjOTIyYjU3IiwiaWQiOiI3YWM5YjVmNS01NDMwLTRkMzAtYjMxNi01Zjg1NzJhMTc1Y2QiLCJ1dHlwZSI6IkVORFVTRVIiLCJvcmdhbmlzYXRpb24iOiI3YzQ1ZGZmNy04NGEwLTQ0OTUtYThiZS1iYjJiNDJkNDU1NDYiLCJkZXB0IjoiIiwicm9sZSI6IkVORFVTRVIiLCJwZXJtaXNzaW9ucyI6e30sImFkbWluX2lkIjoiN2M4MjVkOGYtYjRjMi00YjQ0LWE0M2YtZTE5MDFkZjdjZDY4In0.YfcIWTYewWAK24-M4GkxbuE2LstAp9C9Yf0mHp0KIGU";

  ProductRepository() {
    _dio.interceptors.add(TalkerDioLogger(talker: Talker()));
  }
  Options _getAuthHeader() {
    return Options(
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

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
        options: _getAuthHeader(),
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;

        if (jsonData != null &&
            jsonData['data'] != null &&
            jsonData['data'] is List) {
          final productList = jsonData['data'] as List;
          return productList.map((json) => GetProduct.fromJson(json)).toList();
        } else {
          return [];
        }
      }
    } catch (e) {
      print('Error fetching products: ${e.toString()}');
    }
    return null;
  }

  Future<Response?> addToCart({required String productId}) async {
    try {
      final data = {
        'product': productId,
        'quantity': 1,
        'variant': '',
      };

      final response = await _dio.post(
        'https://app.backend.brexa.ai${ApiUrl.addToCart}',
        data: data,
        options: _getAuthHeader(),
      );

      return response;
    } catch (e) {
      return null;
    }
  }

  Future<CartModel?> getCartItems() async {
    try {
      final response = await _dio.get(
        'https://app.backend.brexa.ai${ApiUrl.getCartItems}',
        options: _getAuthHeader(),
      );

      if (response.statusCode == 200) {
        return CartModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<AddressModel?> getAddresses() async {
    try {
      final response = await _dio.get(
        'https://app.backend.brexa.ai${ApiUrl.getShippingAddress}',
        queryParameters: {
          'type': 'SHIPPING_ADDRESS',
        },
        options: _getAuthHeader(),
      );

      if (response.statusCode == 200) {
        return AddressModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
