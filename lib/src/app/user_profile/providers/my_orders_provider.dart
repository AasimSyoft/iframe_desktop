import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/data/models/order.dart';
import 'package:iframe_desktop/src/app/user_profile/data/repository/user_repository.dart';

// Create a provider for the OrdersRepository
final ordersRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

// Create a FutureProvider for fetching orders
final ordersProvider = FutureProvider<OrdersModel>((ref) async {
  final ordersRepository = ref.watch(ordersRepositoryProvider);
  return ordersRepository.fetchOrders();
});
