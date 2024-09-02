import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/features/product/providers/category_provider.dart';

class CategoryListView extends ConsumerWidget {
  final List<String> categories;
  final Axis scrollDirection;
  final void Function(String) onCategorySelected;

  const CategoryListView({
    super.key,
    required this.categories,
    this.scrollDirection = Axis.vertical,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String selectedCategory = ref.watch(categoryProvider);

    final screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth >= 1024;

    // Include the default "All" category in the list
    final categoriesWithAll = ['All'] + categories;

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
                  Expanded(
                    child: _buildCategoryList(
                      selectedCategory,
                      ref,
                      isDesktop,
                      categoriesWithAll,
                    ),
                  ),
                ],
              )
            : _buildCategoryList(
                selectedCategory,
                ref,
                isDesktop,
                categoriesWithAll,
              ),
      ),
    );
  }

  Widget _buildCategoryList(
    String selectedCategory,
    WidgetRef ref,
    bool isDesktop,
    List<String> categoriesWithAll,
  ) {
    return ListView(
      scrollDirection: scrollDirection,
      padding: EdgeInsets.zero,
      children: categoriesWithAll.map((category) {
        final isSelected = category == selectedCategory;

        return Padding(
          padding: scrollDirection == Axis.vertical
              ? const EdgeInsets.symmetric(horizontal: 10.0)
              : const EdgeInsets.symmetric(horizontal: 5.0),
          child: isDesktop
              ? _buildDesktopCategoryItem(
                  category,
                  isSelected,
                  ref,
                  categoriesWithAll.indexOf(category),
                )
              : _buildMobileTabletCategoryItem(category, isSelected, ref),
        );
      }).toList(),
    );
  }

  Widget _buildDesktopCategoryItem(
    String category,
    bool isSelected,
    WidgetRef ref,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        onCategorySelected(category);
      },
      child: Container(
        margin: scrollDirection == Axis.vertical
            ? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0)
            : const EdgeInsets.symmetric(horizontal: 10.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(
                  colors: [Colors.white12, Colors.brown.shade500],
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? Colors.brown.shade500 : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileTabletCategoryItem(
    String category,
    bool isSelected,
    WidgetRef ref,
  ) {
    return ChoiceChip(
      label: Text(category),
      selected: isSelected,
      onSelected: (selected) {
        onCategorySelected(category);
      },
      selectedColor: Colors.brown.shade500,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.black : Colors.black,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
