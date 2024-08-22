import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/features/product/data/models/product_catagory.dart';
import 'package:iframe_desktop/src/features/product/data/repository/product_repository.dart';

import '../data/models/product.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});
final selectedCategoryProvider = StateProvider<String?>((ref) => null);

final productCategoriesProvider =
    FutureProvider.family<ProductCategoryModel?, String>((ref, type) async {
  final repository = ref.read(productRepositoryProvider);
  return repository.getProductCategories(type);
});

final productsProvider =
    FutureProvider.family<List<GetProduct>?, String?>((ref, categoryId) async {
  final repository = ref.read(productRepositoryProvider);

  return repository.getProducts(
    categoryId,
  );
});
