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

  VerifyOtpState({
    this.isLoading = false,
    this.message,
    this.isOtpVerified = false,
  });

  VerifyOtpState copyWith({
    bool? isLoading,
    String? message,
    bool? isOtpVerified,
  }) {
    return VerifyOtpState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      isOtpVerified: isOtpVerified ?? this.isOtpVerified,
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
      state = state.copyWith(
        isLoading: false,
        isOtpVerified: true,
        message: 'OTP verified successfully',
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP verified successfully')),
      );
      context.go(Routes.editProfile);
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
