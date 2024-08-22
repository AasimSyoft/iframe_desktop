import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../category/providers/category_provider.dart';

class CategoryListView extends ConsumerWidget {
  final List<String> categories;
  final Axis scrollDirection;

  const CategoryListView({
    super.key,
    required this.categories,
    this.scrollDirection = Axis.vertical,
    required Null Function(dynamic category) onCategorySelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(categoryProvider);

    final screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth >= 1024;

    return SizedBox(
      height: scrollDirection == Axis.horizontal ? 60.0 : null,
      child: Padding(
        padding: scrollDirection == Axis.vertical
            ? const EdgeInsets.only(top: 30.0, bottom: 40.0)
            : const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: scrollDirection == Axis.vertical
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category List
                  Expanded(
                    child: _buildCategoryList(selectedIndex, ref, isDesktop),
                  ),
                ],
              )
            : _buildCategoryList(selectedIndex, ref, isDesktop),
      ),
    );
  }

  Widget _buildCategoryList(int selectedIndex, WidgetRef ref, bool isDesktop) {
    return ListView(
      scrollDirection: scrollDirection,
      padding: EdgeInsets.zero,
      children: categories.asMap().entries.map((entry) {
        final index = entry.key;
        final category = entry.value;
        final isSelected = selectedIndex == index;

        return Padding(
          padding: scrollDirection == Axis.vertical
              ? const EdgeInsets.symmetric(horizontal: 10.0)
              : const EdgeInsets.symmetric(horizontal: 5.0),
          child: isDesktop
              ? _buildDesktopCategoryItem(category, isSelected, ref, index)
              : _buildMobileTabletCategoryItem(
                  category, isSelected, ref, index),
        );
      }).toList(),
    );
  }

  // Styling for Desktop
  Widget _buildDesktopCategoryItem(
      String category, bool isSelected, WidgetRef ref, int index) {
    return GestureDetector(
      onTap: () {
        ref.read(categoryProvider.notifier).selectCategory(index);
      },
      child: Container(
        margin: scrollDirection == Axis.vertical
            ? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0)
            : const EdgeInsets.symmetric(
                horizontal: 10.0), // Adjust margin for horizontal scroll
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [Colors.white12, Colors.brown.shade500],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              color: Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  // Styling for Mobile/Tablet
  Widget _buildMobileTabletCategoryItem(
      String category, bool isSelected, WidgetRef ref, int index) {
    return ChoiceChip(
      label: Text(category),
      selected: isSelected,
      onSelected: (selected) {
        ref.read(categoryProvider.notifier).selectCategory(index);
      },
      selectedColor: Colors.brown.shade500,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.black,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected ? Colors.transparent : Colors.grey,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
