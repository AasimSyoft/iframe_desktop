import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/features/product/data/models/address.dart';
import 'package:iframe_desktop/src/features/product/data/repository/product_repository.dart';

final addressProvider = FutureProvider<AddressModel?>((ref) async {
  final repository = ref.read(productRepositoryProvider);
  return await repository.getAddresses();
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});
