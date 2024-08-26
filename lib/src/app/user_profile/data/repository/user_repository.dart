import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:iframe_desktop/src/app/constants/api_url.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/appointments.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/enquiry.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/meetings.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/order.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/service.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/user.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UserRepository {
  final Dio _dio = Dio();
  final String accessToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI0OTIzNTQxLCJpYXQiOjE3MjQ2NjQzNDEsImp0aSI6IjdjYjA5MzhmODZkNDRkMzQ5NTE1YzdmNjc0NjZmNzhlIiwiaWQiOiI3YWM5YjVmNS01NDMwLTRkMzAtYjMxNi01Zjg1NzJhMTc1Y2QiLCJ1dHlwZSI6IkVORFVTRVIiLCJvcmdhbmlzYXRpb24iOiI3YzQ1ZGZmNy04NGEwLTQ0OTUtYThiZS1iYjJiNDJkNDU1NDYiLCJkZXB0IjoiIiwicm9sZSI6IkVORFVTRVIiLCJwZXJtaXNzaW9ucyI6e30sImFkbWluX2lkIjoiN2M4MjVkOGYtYjRjMi00YjQ0LWE0M2YtZTE5MDFkZjdjZDY4In0.hgYG9fx0LA8rRtFV9PTDVGE0LKA0E7tJHZLKAZHnRyU";

  UserRepository() {
    _dio.interceptors.add(TalkerDioLogger(talker: Talker()));
  }

  Options _getAuthHeader() {
    return Options(
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
  }

  Future<Response> postUserProfileInfo({
    required String ccode,
    required String fname,
    required String gender,
    required String id,
    required String image,
    required bool isNewUser,
    required String lname,
    required String phoneNumber,
  }) async {
    const String url = 'https://stage.backend.brexa.ai${ApiUrl.info}';

    final Map<String, dynamic> data = {
      'ccode': ccode,
      'fname': fname,
      'gender': gender,
      'id': id,
      'image': image,
      'is_new_user': isNewUser,
      'lname': lname,
      'phone_number': phoneNumber,
    };

    try {
      final Response response =
          await _dio.post(url, data: data, options: _getAuthHeader());
      return response;
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error posting user profile info: ${e.message}');
      }
      rethrow;
    }
  }

  Future<UserModel> fetchUserInfo() async {
    const String url = 'https://stage.backend.brexa.ai${ApiUrl.info}';

    try {
      final Response response = await _dio.get(url, options: _getAuthHeader());

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load user info');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error fetching user info: ${e.message}');
      }
      rethrow;
    }
  }

  Future<List<Enquiry>> fetchEnquiries() async {
    const String url = 'https://stage.backend.brexa.ai${ApiUrl.enquiry}';

    try {
      print('Token issssssssssssssssssss${()}');

      final Response response = await _dio.get(url, options: _getAuthHeader());

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];

        return data.map((json) => Enquiry.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load enquiries');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error fetching enquiries: ${e.message}');
      }
      rethrow;
    }
  }

  Future<MeetingsModel> fetchMeetings() async {
    const String url = 'https://stage.backend.brexa.ai${ApiUrl.meeting}';

    try {
      final Response response = await _dio.get(url, options: _getAuthHeader());

      if (response.statusCode == 200) {
        return MeetingsModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load meetings');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error fetching meetings: ${e.message}');
      }
      rethrow;
    }
  }

  Future<OrdersModel> fetchOrders() async {
    const String url = 'https://stage.backend.brexa.ai${ApiUrl.orders}';

    try {
      final Response response = await _dio.get(url, options: _getAuthHeader());

      if (response.statusCode == 200) {
        return OrdersModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load orders');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error fetching orders: ${e.message}');
      }
      rethrow;
    }
  }

  Future<MyAppointment> fetchAppointments() async {
    const String url = 'https://stage.backend.brexa.ai${ApiUrl.appoitments}';
    final queryParams = {
      'page': 1,
      'offset': 20,
    };

    try {
      final Response response = await _dio.get(url,
          queryParameters: queryParams, options: _getAuthHeader());

      if (response.statusCode == 200) {
        return MyAppointment.fromJson(response.data);
      } else {
        throw Exception('Failed to load appointments');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error fetching appointments: ${e.message}');
      }
      rethrow;
    }
  }

  Future<ClientProjectsModel> fetchClientProjects() async {
    const String url =
        'https://stage.backend.brexa.ai${ApiUrl.getClientProjects}';

    try {
      final Response response = await _dio.get(url, options: _getAuthHeader());

      if (response.statusCode == 200) {
        return ClientProjectsModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load client projects');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error fetching client projects: ${e.message}');
      }
      rethrow;
    }
  }
}
