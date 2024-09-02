// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:iframe_desktop/src/features/cart/presentation/providers/cart_provider.dart';
// import 'package:iframe_desktop/src/features/product/providers/product_provider.dart';
// import 'package:iframe_desktop/src/features/product/widgets/product_card_widget.dart';
// import 'package:responsive_grid_list/responsive_grid_list.dart';

// import 'category_view.dart';

// class ProductScreen extends ConsumerWidget {
//   const ProductScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedCategoryId = ref.watch(selectedCategoryProvider);
//     final cartProducts = ref.watch(cartProvider);

//     final productCategoriesAsyncValue =
//         ref.watch(productCategoriesProvider(''));

//     return productCategoriesAsyncValue.when(
//       data: (productCategoryModel) {
//         final categories = productCategoryModel?.productCategory ?? [];
//         final categoryNames =
//             categories.map((category) => category.name ?? 'Unknown').toList();
//         final hasCartItems = cartProducts.isNotEmpty;

//         return LayoutBuilder(
//           builder: (context, constraints) {
//             final screenWidth = constraints.maxWidth;

//             final isMobile = screenWidth < 720;
//             final isTablet = screenWidth >= 780 && screenWidth < 1200;

//             // Define crossAxisCount based on cart items
//             final crossAxisCount = hasCartItems
//                 ? 2
//                 : (isMobile
//                     ? 1
//                     : isTablet
//                         ? 2
//                         : 3);

//             final childAspectRatio = hasCartItems
//                 ? (isMobile
//                     ? 8 / 3.13
//                     : isTablet
//                         ? 5 / 2.60
//                         : 6 / 3)
//                 : (isMobile
//                     ? 8 / 3.13
//                     : isTablet
//                         ? 5 / 2.60
//                         : 5 / 2.75);

//             Widget content = isMobile || isTablet
//                 ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CategoryListView(
//                         categories: categoryNames,
//                         scrollDirection: Axis.horizontal,
//                         onCategorySelected: (categoryId) {
//                           ref.read(selectedCategoryProvider.notifier).state =
//                               categoryId;
//                         },
//                       ),
//                       Expanded(
//                         child: _buildGrid(
//                           context,
//                           ref,
//                           crossAxisCount,
//                           childAspectRatio,
//                           selectedCategoryId,
//                           hasCartItems,
//                         ),
//                       ),
//                     ],
//                   )
//                 : Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       if (!isMobile && !isTablet)
//                         Expanded(
//                           flex: 1,
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 40.0),
//                             child: CategoryListView(
//                               categories: categoryNames,
//                               onCategorySelected: (category) {
//                                 ref
//                                     .read(selectedCategoryProvider.notifier)
//                                     .state = category;
//                               },
//                             ),
//                           ),
//                         ),
//                       Expanded(
//                         flex: 5,
//                         child: Padding(
//                           padding: const EdgeInsets.only(
//                               right: 30, left: 30, bottom: 40.0),
//                           child: _buildGrid(
//                             context,
//                             ref,
//                             crossAxisCount,
//                             childAspectRatio,
//                             selectedCategoryId,
//                             hasCartItems,
//                           ),
//                         ),
//                       ),
//                     ],
//                   );

//             return Scaffold(
//               backgroundColor: Colors.white,
//               body: content,
//             );
//           },
//         );
//       },
//       loading: () => const Center(child: CircularProgressIndicator()),
//       error: (error, stackTrace) => Center(child: Text('Error: $error')),
//     );
//   }

//   Widget _buildGrid(
//     BuildContext context,
//     WidgetRef ref,
//     int crossAxisCount,
//     double childAspectRatio,
//     String? categoryId,
//     bool hasCartItems,
//   ) {
//     final productsAsyncValue = ref.watch(productsProvider(categoryId));
//     // final cartProducts = ref.watch(cartProvider);

//     return productsAsyncValue.when(
//       data: (products) {
//         if (products == null || products.isEmpty) {
//           return const Center(child: Text('No products available.'));
//         }

//         return ResponsiveGridList(
//           minItemsPerRow: crossAxisCount,
//           maxItemsPerRow: crossAxisCount,
//           horizontalGridSpacing: 8.0,
//           verticalGridSpacing: 8.0,
//           minItemWidth: 150,
//           children: products.map((product) {
//             return ProductCardWidget(
//               name: product.name,
//               imageUrl: product.image != null && product.image!.isNotEmpty
//                   ? product.image!.first
//                   : 'assets/images/default_product.png',
//               price: product.price,
//               // isInCart: cartProducts.any((p) => p.id == product.id),
//               description: product.description ?? 'No description available',
//               weight: product.measure ?? 'Unknown weight',
//               onViewDetails: () {},
//               onAddToCart: () async {
//                 ref.read(cartProvider.notifier).addToCart(product);

//                 // ref.read(cartItemProvider.notifier).addToCart(product.id);

//                 // ref.read(cartItemsProvider);
//               },
//             );
//           }).toList(),
//         );
//       },
//       loading: () => const Center(child: CircularProgressIndicator()),
//       error: (error, stackTrace) => Center(child: Text('Error: $error')),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:iframe_desktop/src/features/product/providers/product_provider.dart';
import 'package:iframe_desktop/src/features/product/widgets/product_card_widget.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import 'category_view.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategoryId = ref.watch(selectedCategoryProvider);
    final cartProducts = ref.watch(cartProvider);

    final productCategoriesAsyncValue =
        ref.watch(productCategoriesProvider(''));

    return productCategoriesAsyncValue.when(
      data: (productCategoryModel) {
        final categories = productCategoryModel?.productCategory ?? [];
        final categoryNames =
            categories.map((category) => category.name ?? 'Unknown').toList();
        final hasCartItems = cartProducts.isNotEmpty;

        return LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final isMobile = screenWidth < 720;
            final isTablet = screenWidth >= 780 && screenWidth < 1200;

            final crossAxisCount = hasCartItems
                ? 2
                : (isMobile
                    ? 1
                    : isTablet
                        ? 2
                        : 3);

            final childAspectRatio = hasCartItems
                ? (isMobile
                    ? 8 / 3.13
                    : isTablet
                        ? 5 / 2.60
                        : 6 / 3)
                : (isMobile
                    ? 8 / 3.13
                    : isTablet
                        ? 5 / 2.60
                        : 5 / 2.75);

            Widget content = isMobile || isTablet
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryListView(
                        categories: categoryNames,
                        scrollDirection: Axis.horizontal,
                        onCategorySelected: (categoryId) {
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
                          hasCartItems,
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMobile && !isTablet)
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: CategoryListView(
                              categories: categoryNames,
                              onCategorySelected: (categoryId) {
                                ref
                                    .read(selectedCategoryProvider.notifier)
                                    .state = categoryId;
                              },
                            ),
                          ),
                        ),
                      Expanded(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 30, left: 30, bottom: 40.0),
                          child: _buildGrid(
                            context,
                            ref,
                            crossAxisCount,
                            childAspectRatio,
                            selectedCategoryId,
                            hasCartItems,
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
    bool hasCartItems,
  ) {
    final productsAsyncValue = ref.watch(productsProvider(categoryId));

    return productsAsyncValue.when(
      data: (products) {
        if (products == null || products.isEmpty) {
          return const Center(child: Text('No products available.'));
        }

        return ResponsiveGridList(
          minItemsPerRow: crossAxisCount,
          maxItemsPerRow: crossAxisCount,
          horizontalGridSpacing: 8.0,
          verticalGridSpacing: 8.0,
          minItemWidth: 150,
          children: products.map((product) {
            return ProductCardWidget(
              name: product.name,
              imageUrl: product.image != null && product.image!.isNotEmpty
                  ? product.image!.first
                  : 'assets/images/default_product.png',
              price: product.price,
              description: product.description ?? 'No description available',
              weight: product.measure ?? 'Unknown weight',
              onViewDetails: () {},
              onAddToCart: () async {
                ref.read(cartProvider.notifier).addToCart(product);
                // ref.read(cartItemProvider.notifier).addToCart(product.id);

                // ref.read(cartItemsProvider);
              },
            );
          }).toList(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
