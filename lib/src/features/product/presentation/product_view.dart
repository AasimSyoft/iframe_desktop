import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:iframe_desktop/src/features/product/providers/product_provider.dart';
import 'package:iframe_desktop/src/features/product/widgets/product_card_widget.dart';

import 'category_view.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryId = ref.watch(selectedCategoryProvider);

    final productCategoriesAsyncValue =
        ref.watch(productCategoriesProvider(''));

    return productCategoriesAsyncValue.when(
      data: (productCategoryModel) {
        final categories = productCategoryModel?.productCategory ?? [];
        final categoryNames =
            categories.map((category) => category.name ?? 'Unknown').toList();

        return LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;

            final isMobile = screenWidth < 720;
            final isTablet = screenWidth >= 780 && screenWidth < 1000;
            final isCartVisible = isTablet;

            final crossAxisCount = isMobile
                ? 1
                : isTablet
                    ? 2
                    : 2;
            final childAspectRatio = isMobile
                ? 8 / 3.13
                : isTablet
                    ? 5 / 2.60
                    : (isCartVisible ? 7 / 3 : 6 / 3);

            Widget content = isMobile || isTablet
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryListView(
                        categories: categoryNames,
                        scrollDirection: Axis.horizontal,
                        onCategorySelected: (categoryId) {
                          print('Selected category: $categoryId');
                          ref.read(selectedCategoryProvider.notifier).state =
                              categoryId;
                        },
                      ),
                      Expanded(
                        child: _buildGrid(
                          context,
                          ref,
                          crossAxisCount,
                          childAspectRatio,
                          selectedCategoryId,
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMobile && !isTablet)
                        Expanded(
                          flex: isTablet ? 1 : 1,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              bottom: 40.0,
                            ),
                            child: CategoryListView(
                              categories: categoryNames,
                              onCategorySelected: (category) {
                                // Update selected category ID
                                ref
                                    .read(selectedCategoryProvider.notifier)
                                    .state = category;
                              },
                            ),
                          ),
                        ),
                      Expanded(
                        flex: isTablet ? 4 : 5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 30,
                            left: 30,
                            bottom: 40.0,
                          ),
                          child: _buildGrid(
                            context,
                            ref,
                            crossAxisCount,
                            childAspectRatio,
                            selectedCategoryId,
                          ),
                        ),
                      ),
                    ],
                  );

            return Scaffold(
              backgroundColor: Colors.white,
              body: content,
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildGrid(
    BuildContext context,
    WidgetRef ref,
    int crossAxisCount,
    double childAspectRatio,
    String? categoryId,
  ) {
    final productsAsyncValue = ref.watch(productsProvider(categoryId));

    return productsAsyncValue.when(
      data: (products) {
        if (products == null || products.isEmpty) {
          return const Center(child: Text('No products available.'));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCardWidget(
              name: product.name,
              imageUrl: product.image != null && product.image!.isNotEmpty
                  ? product.image!.first
                  : 'assets/images/default_product.png',
              price: product.price,
              isInCart: false,
              description: product.description ?? 'No description available',
              weight: product.measure ?? 'Unknown weight',
              onViewDetails: () {},
              onAddToCart: () {
                ref.read(cartProvider.notifier).addToCart(product);
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
