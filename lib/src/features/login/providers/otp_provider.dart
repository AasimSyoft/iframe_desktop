import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iframe_desktop/src/app/routes/app_router.dart';
import 'package:iframe_desktop/src/features/login/data/repository/login_repository.dart';
import 'package:iframe_desktop/src/features/login/providers/login_provider.dart';

class VerifyOtpState {
  final bool isLoading;
  final String? message;
  final bool isOtpVerified;
  final String? userId; // Add userId field

  VerifyOtpState({
    this.isLoading = false,
    this.message,
    this.isOtpVerified = false,
    this.userId, // Initialize userId
  });

  VerifyOtpState copyWith({
    bool? isLoading,
    String? message,
    bool? isOtpVerified,
    String? userId, // Add userId to copyWith
  }) {
    return VerifyOtpState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      isOtpVerified: isOtpVerified ?? this.isOtpVerified,
      userId: userId ?? this.userId, // Update userId
    );
  }
}

class VerifyOtpNotifier extends StateNotifier<VerifyOtpState> {
  final LoginRepository loginRepository;

  VerifyOtpNotifier(this.loginRepository) : super(VerifyOtpState());

  Future<void> verifyOtp(
      String otp, String userId, BuildContext context) async {
    state = state.copyWith(isLoading: true);

    final response = await loginRepository.verifyOtp(otp: otp, id: userId);

    if (response != null && response.statusCode == 200) {
      // Extract userId from the nested data field
      final responseData = response.data['data']; // Access the data field
      final extractedUserId = responseData['id']; // Extract the ID from data

      state = state.copyWith(
        isLoading: false,
        isOtpVerified: true,
        message: 'OTP verified successfully',
        userId: extractedUserId, // Set the userId in state
      );
      print("UserId isssssssssssssssssssss:$extractedUserId");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP verified successfully')),
      );

      // Pass the ID to the edit profile page
      context.go(Routes.editProfile, extra: {'userId': extractedUserId});
    } else {
      state = state.copyWith(
        isLoading: false,
        isOtpVerified: false,
        message: 'OTP verification failed',
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP verification failed')),
      );
    }
  }
}

final verifyOtpProvider =
    StateNotifierProvider<VerifyOtpNotifier, VerifyOtpState>(
  (ref) => VerifyOtpNotifier(ref.read(loginRepositoryProvider)),
);
