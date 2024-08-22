import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryNotifier extends StateNotifier<int> {
  CategoryNotifier() : super(0);

  void selectCategory(int index) {
    state = index;
  }
}

final categoryProvider = StateNotifierProvider<CategoryNotifier, int>((ref) {
  return CategoryNotifier();
});
