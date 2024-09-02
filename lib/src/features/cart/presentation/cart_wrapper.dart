// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:iframe_desktop/src/features/cart/presentation/providers/cart_provider.dart';
// import 'package:iframe_desktop/src/features/product/presentation/product_view.dart';
// import 'package:responsive_builder/responsive_builder.dart';

// class CartWrapper extends ConsumerWidget {
//   final Widget child;

//   const CartWrapper({super.key, required this.child});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final cartProducts = ref.watch(cartProvider);

//     return ScreenTypeLayout.builder(
//       desktop: (context) => Row(
//         children: [
//           const Expanded(
//             flex: 3,
//             child: ProductScreen(),
//           ),
//           if (cartProducts
//               .isNotEmpty) // Only show the cart view if there are items
//             Expanded(
//               child: child,
//             ),
//         ],
//       ),
//       tablet: (context) => Column(
//         children: [
//           const Expanded(
//             child: ProductScreen(),
//           ),
//           if (cartProducts
//               .isNotEmpty) // Only show the cart view if there are items
//             Expanded(
//               child: child,
//             ),
//         ],
//       ),
//       mobile: (context) => Column(
//         children: [
//           const Expanded(
//             child: ProductScreen(),
//           ),
//           if (cartProducts
//               .isNotEmpty) // Only show the cart view if there are items
//             Expanded(
//               child: child,
//             ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/features/cart/presentation/providers/cart_provider.dart';
import 'package:iframe_desktop/src/features/product/presentation/product_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CartWrapper extends ConsumerWidget {
  final Widget child;

  const CartWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProducts = ref.watch(cartProvider);

    return ScreenTypeLayout.builder(
      desktop: (context) => Row(
        children: [
          const Expanded(
            flex: 3,
            child: ProductScreen(),
          ),
          if (cartProducts.isNotEmpty)
            Expanded(
              child: child,
            ),
        ],
      ),
      tablet: (context) => Column(
        children: [
          const Expanded(
            child: ProductScreen(),
          ),
          if (cartProducts.isNotEmpty)
            const Expanded(
              child: SizedBox.shrink(),
            ),
        ],
      ),
      mobile: (context) => Column(
        children: [
          const Expanded(
            child: ProductScreen(),
          ),
          if (cartProducts.isNotEmpty)
            Expanded(
              child: child,
            ),
        ],
      ),
    );
  }
}
