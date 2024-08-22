import 'package:dio/dio.dart';
import 'package:iframe_desktop/src/app/constants/api_url.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_flutter/talker_flutter.dart';

class UserRepository {
  final Dio _dio = Dio();

  UserRepository() {
    _dio.interceptors.add(TalkerDioLogger(talker: Talker()));
  }

 
}
