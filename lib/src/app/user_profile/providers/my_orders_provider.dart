import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/order.dart';
import 'package:iframe_desktop/src/app/user_profile/data/repository/user_repository.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final ordersProvider = FutureProvider<OrdersModel>((ref) async {
  final userRepository = ref.watch(userRepositoryProvider);
  try {
    final orders = await userRepository.fetchOrders();
    return orders;
  } catch (e) {
    throw Exception('Failed to load orders: $e');
  }
});
