import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:iframe_desktop/src/app/constants/api_url.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart'; // For using Talker

class LoginRepository {
  final Dio _dio = Dio();

  LoginRepository() {
    _dio.interceptors.add(TalkerDioLogger(talker: Talker()));
  }

  Future<Map<String, dynamic>?> loginUser(String email) async {
    const String organisationId = '7c45dff7-84a0-4495-a8be-bb2b42d45546';

    final Map<String, dynamic> body = {
      "data": email,
      "ccode": "",
      "organisation": organisationId,
      "login_type": "email",
    };

    try {
      Response response = await _dio.post(
        'https://stage.backend.brexa.ai${ApiUrl.logIn}',
        data: body,
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print(response.data);
        }
        return response.data;
      } else {
        if (kDebugMode) {
          print('Login failed with status: ${response.statusCode}');
        }
        return null;
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print(
            'Dio error! Status: ${e.response?.statusCode}, Data: ${e.response?.data}');
      }
      return null;
    }
  }

  Future<Response?> verifyOtp({required String otp, required String id}) async {
    final Map<String, dynamic> body = {
      "otp": otp,
      "id": id,
    };

    try {
      Response response = await _dio.post(
        'https://stage.backend.brexa.ai${ApiUrl.verifyOtp}',
        data: body,
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        print('OTP verification failed with status: ${response.statusCode}');
        return response;
      }
    } on DioException catch (e) {
      print(
          'Dio error! Status: ${e.response?.statusCode}, Data: ${e.response?.data}');
      return null;
    }
  }
}
