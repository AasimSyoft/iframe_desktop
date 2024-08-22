// cart_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/features/product/data/models/product.dart';

class CartNotifier extends StateNotifier<List<GetProduct>> {
  CartNotifier() : super([]);

  void addToCart(product) {
    state = [...state, product];
  }

  void removeFromCart(GetProduct product) {
    state = state.where((p) => p.id != product.id).toList();
  }
}

final cartProvider =
    StateNotifierProvider<CartNotifier, List<GetProduct>>((ref) {
  return CartNotifier();
});
