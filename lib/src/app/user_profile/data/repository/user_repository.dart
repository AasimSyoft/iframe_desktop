import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:iframe_desktop/src/app/constants/api_url.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/enquiry.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/meetings.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/order.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UserRepository {
  final Dio _dio = Dio();

  UserRepository() {
    _dio.interceptors.add(TalkerDioLogger(talker: Talker()));
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
    const String url = 'https://org404040.stage.brexa.ai${ApiUrl.info}';

    final Map<String, dynamic> data = {
      'ccode': ccode,
      'fname': fname,
      'gender': "",
      'id': id,
      'image': "",
      'is_new_user': isNewUser,
      'lname': lname,
      'phone_number': "",
    };

    try {
      final Response response = await _dio.post(url, data: data);
      return response;
    } on DioException catch (e) {
      if (kDebugMode) {
        print('Error posting user profile info: ${e.message}');
      }
      rethrow;
    }
  }

  Future<List<Enquiry>> fetchEnquiries() async {
    const String url = 'https://org404040.stage.brexa.ai${ApiUrl.enquiry}';

    try {
      final Response response = await _dio.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        print(response.data);
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
    const String url = 'https://org404040.stage.brexa.ai${ApiUrl.meeting}';

    try {
      final Response response = await _dio.get(url);

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
    const String url = 'https://org404040.stage.brexa.ai${ApiUrl.orders}';

    try {
      final Response response = await _dio.get(url);

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
}
