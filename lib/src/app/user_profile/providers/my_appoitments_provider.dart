import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/appointments.dart';
import 'package:iframe_desktop/src/app/user_profile/data/repository/user_repository.dart';
import 'package:iframe_desktop/src/app/user_profile/providers/my_enquiry_provider.dart';

class AppointmentsNotifier extends StateNotifier<AsyncValue<MyAppointment>> {
  final UserRepository _repository;

  AppointmentsNotifier(this._repository) : super(const AsyncValue.loading());

  Future<void> fetchAppointments(int page, int offset) async {
    try {
      final appointments = await _repository.fetchAppointments();
      state = AsyncValue.data(appointments);
    } catch (e, stackTrace) {
      state =
          AsyncValue.error(e, stackTrace); // Update state to reflect the error
    }
  }
}

// Create a provider for the AppointmentsNotifier
final appointmentsProvider = StateNotifierProvider.autoDispose<
    AppointmentsNotifier, AsyncValue<MyAppointment>>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return AppointmentsNotifier(repository);
});
