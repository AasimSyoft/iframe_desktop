import 'package:dio/dio.dart';

/// Represents an exception that occurs during API communication.
///
/// This exception is thrown when there is an error in the API response or during the API request.
/// It provides a standardized way to handle different types of API errors and convert them into user-friendly error messages.
class ApiException implements Exception {
  /// The error message associated with the exception.
  late final String message;

  /// Creates an instance of [ApiException] from a [DioException].
  ///
  /// The [DioException] is used to determine the type of error and generate an appropriate error message.
  ApiException.fromDioException(DioException dioError) {
    message = _handleDioError(dioError);
  }

  /// Handles the [DioException] and returns an error message based on the error type.
  String _handleDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return 'The request was cancelled. Please try again.';
      case DioExceptionType.connectionTimeout:
        return 'The connection timed out. Please check your internet connection and try again.';
      case DioExceptionType.receiveTimeout:
        return 'The server is taking too long to respond. Please try again later.';
      case DioExceptionType.badResponse:
        return _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
      case DioExceptionType.sendTimeout:
        return 'The request is taking too long to send. Please check your internet connection and try again.';
      case DioExceptionType.connectionError:
        return 'Unable to connect to the server. Please check your internet connection and try again.';
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return 'No internet connection. Please check your connection and try again.';
        } else {
          return 'An unexpected error occurred. Please try again.';
        }
      default:
        return 'An error occurred. Please try again.';
    }
  }

  /// Handles the error based on the status code and returns an appropriate error message.
  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['message'] ??
            'There was an issue with your request. Please check and try again.';
      case 401:
        return 'You need to log in to access this feature. Please log in and try again.';
      case 403:
        return 'You do not have permission to perform this action.';
      case 404:
        return 'The resource you are looking for could not be found.';
      case 500:
        return 'There is an issue with our server. Please try again later.';
      case 502:
        return 'Bad response from server. Please try again later.';
      case 503:
        return 'The service is currently unavailable. Please try again later.';
      case 504:
        return 'The server is taking too long to respond. Please try again later.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }

  @override
  String toString() => message;
}
