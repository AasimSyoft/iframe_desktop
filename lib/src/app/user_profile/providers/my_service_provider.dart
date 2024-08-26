import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/service.dart';
import 'package:iframe_desktop/src/app/user_profile/data/repository/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final clientProjectsProvider = FutureProvider<ClientProjectsModel>((ref) async {
  final userRepository = ref.read(userRepositoryProvider);
  return await userRepository.fetchClientProjects();
});
