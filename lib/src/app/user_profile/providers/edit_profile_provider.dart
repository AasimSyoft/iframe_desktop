import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/repository/user_repository.dart';

class UserProfileState {
  final bool isLoading;
  final String? message;

  UserProfileState({this.isLoading = false, this.message});

  UserProfileState copyWith({bool? isLoading, String? message}) {
    return UserProfileState(
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
    );
  }
}

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  final UserRepository userRepository;

  UserProfileNotifier(this.userRepository) : super(UserProfileState());

  Future<void> postUserProfileInfo({
    required String ccode,
    required String fname,
    required String lname,
    required String phoneNumber,
    required bool isNewUser,
    required String id,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      final response = await userRepository.postUserProfileInfo(
        ccode: ccode,
        fname: fname,
        lname: lname,
        phoneNumber: phoneNumber,
        isNewUser: isNewUser,
        id: id,
        gender: "",
        image: "",
      );

      if (response.statusCode == 200) {
        state = state.copyWith(
            isLoading: false, message: 'Profile updated successfully');
      } else {
        state = state.copyWith(
            isLoading: false, message: 'Failed to update profile');
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, message: 'Error: $e');
    }
  }
}

// Provider for UserRepository
final userRepositoryProvider = Provider((ref) => UserRepository());

// Provider for UserProfileNotifier
final userProfileNotifierProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileState>(
  (ref) => UserProfileNotifier(ref.watch(userRepositoryProvider)),
);
