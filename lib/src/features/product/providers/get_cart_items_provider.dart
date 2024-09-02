import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/features/product/data/models/cart.dart';
import 'package:iframe_desktop/src/features/product/data/repository/product_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

final cartItemsProvider = FutureProvider<CartModel?>((ref) async {
  final repository = ref.read(productRepositoryProvider);
  return await repository.getCartItems();
});
