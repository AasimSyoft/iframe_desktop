import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/features/product/data/repository/product_repository.dart';

final productRepositoryProvider = Provider((ref) => ProductRepository());

final cartItemProvider =
    StateNotifierProvider<CartNotifier, List<String>>((ref) {
  return CartNotifier(ref.read(productRepositoryProvider));
});

class CartNotifier extends StateNotifier<List<String>> {
  final ProductRepository _productRepository;

  CartNotifier(this._productRepository) : super([]);

  Future<void> addToCart(String productId) async {
    final response = await _productRepository.addToCart(
      productId: productId,
    );

    // Handle the response, checking for success based on status code
    if (response != null &&
        (response.statusCode == 200 || response.statusCode == 201)) {
      state = [...state, productId];
    } else {
      print(
          'Failed to add product to cart. Status code: ${response?.statusCode}');
    }
  }
}
