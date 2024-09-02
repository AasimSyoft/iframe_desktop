import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryNotifier extends StateNotifier<String> {
  CategoryNotifier() : super('All');

  void selectCategory(String category) {
    state = category;
  }
}

final categoryProvider = StateNotifierProvider<CategoryNotifier, String>((ref) {
  return CategoryNotifier();
});
