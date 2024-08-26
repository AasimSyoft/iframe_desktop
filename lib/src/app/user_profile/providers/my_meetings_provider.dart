import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/meetings.dart';
import 'package:iframe_desktop/src/app/user_profile/data/repository/user_repository.dart'; // Import your MeetingsModel

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final meetingsProvider = FutureProvider<MeetingsModel>((ref) async {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchMeetings();
});
