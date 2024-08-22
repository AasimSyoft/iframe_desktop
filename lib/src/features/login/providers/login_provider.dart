import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iframe_desktop/src/app/routes/app_router.dart';
import 'package:iframe_desktop/src/features/login/data/repository/login_repository.dart';

class LoginState {
  final bool isLoading;
  final String? message;
  final String? userId;
  final String? email;

  LoginState({
    this.isLoading = false,
    this.message,
    this.userId,
    this.email,
  });

  LoginState copyWith({
    bool? isLoading,
    String? message,
    String? userId,
    String? email,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
      userId: userId ?? this.userId,
      email: email ?? this.email,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginRepository loginRepository;

  LoginNotifier(this.loginRepository) : super(LoginState());

  Future<void> login(String email, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final response = await loginRepository.loginUser(email);

    if (response != null && response['status'] == 200) {
      final userId = response['data']['id'];
      state = state.copyWith(
        isLoading: false,
        userId: userId,
        message: response['message'],
        email: email,
      );

      // ignore: use_build_context_synchronously
      if (kDebugMode) {
        print(userId);
      }
      context.go(Routes.verifyOtp, extra: {'userId': userId});
    } else {
      state = state.copyWith(isLoading: false, message: 'Login failed');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    }
  }
}

final loginRepositoryProvider = Provider((ref) => LoginRepository());

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>(
  (ref) => LoginNotifier(ref.read(loginRepositoryProvider)),
);
