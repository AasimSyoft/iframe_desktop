import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/features/product/presentation/product_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CartWrapper extends ConsumerWidget {
  final Widget child;

  const CartWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenTypeLayout.builder(
      desktop: (context) => Row(
        children: [
          const Expanded(
            flex: 3,
            child: ProductScreen(),
          ),
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
          Expanded(
            child: child,
          ),
        ],
      ),
      mobile: (BuildContext context) => Column(
        children: [
          const Expanded(
            child: ProductScreen(),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
