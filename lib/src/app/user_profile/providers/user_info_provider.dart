import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/user.dart';
import 'package:iframe_desktop/src/app/user_profile/data/repository/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final userInfoProvider = FutureProvider<UserModel>((ref) async {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchUserInfo();
});