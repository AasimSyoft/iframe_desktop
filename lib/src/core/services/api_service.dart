import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:iframe_desktop/src/config.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../exceptions/api_exception.dart';

/// A service class to handle API requests using Dio.
class ApiService {
  /// Constructor that initializes the Dio instance.
  ApiService() {
    _initializeDio();
  }

  late final Dio _dio;

  /// Initializes the Dio instance with base options.
  void _initializeDio() {
    final String baseUrl = ConfigEnvironments.getEnvironmentUrl;
    final baseOption = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
    );
    _dio = Dio(baseOption);
    if (!kReleaseMode) {
      _dio.interceptors.add(
        TalkerDioLogger(
          talker: talker,
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseMessage: true,
            printResponseData: false,
          ),
        ),
      );
    }
  }

  final Talker talker = Talker(
    settings: TalkerSettings(
      enabled: kDebugMode,
      useHistory: false,
      maxHistoryItems: 1,
    ),
  );

  /// Sends a GET request to the specified [path].
  ///
  /// [path] is the endpoint to which the GET request is sent.
  /// [queryParameters] are optional query parameters to include in the request.
  ///
  /// Returns a [Future] that resolves to the response of the GET request.
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      return Future.error(ApiException.fromDioException(e).message);
    }
  }

  /// Sends a POST request to the specified [path].
  ///
  /// [path] is the endpoint to which the POST request is sent.
  /// [data] is the optional data to include in the body of the POST request.
  /// [queryParameters] are optional query parameters to include in the request.
  ///
  /// Returns a [Future] that resolves to the response of the POST request.
  Future<Response> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await _dio.post(path, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      return Future.error(ApiException.fromDioException(e).message);
    }
  }

  /// Sends a PUT request to the specified [path].
  ///
  /// [path] is the endpoint to which the PUT request is sent.
  /// [data] is the optional data to include in the body of the PUT request.
  /// [queryParameters] are optional query parameters to include in the request.
  ///
  /// Returns a [Future] that resolves to the response of the PUT request.
  Future<Response> put(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await _dio.put(path, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      return Future.error(ApiException.fromDioException(e).message);
    }
  }

  /// Sends a DELETE request to the specified [path].
  ///
  /// [path] is the endpoint to which the DELETE request is sent.
  /// [queryParameters] are optional query parameters to include in the request.
  ///
  /// Returns a [Future] that resolves to the response of the DELETE request.
  Future<Response> delete(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await _dio.delete(path, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      return Future.error(ApiException.fromDioException(e).message);
    }
  }
}
