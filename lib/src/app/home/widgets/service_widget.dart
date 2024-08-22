import 'package:flutter/material.dart';

import 'product_widget.dart';

class ServiceWidget extends StatefulWidget {
  const ServiceWidget({super.key});

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> with AutomaticKeepAliveClientMixin {
  final List<Product> _products = List.generate(
    5,
    (index) => Product(
      id: 'product_$index',
      name: 'Service $index',
      image: "assets/images/ecom.jpeg",
      price: (index + 1) * 10.0,
    ),
  );

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Services',
          style: TextStyle(fontWeight: FontWeight.bold),
        ), // Hard-coded heading
        const SizedBox(height: 12.0),
        ProductListBuilder(products: _products, type: 'service'),
      ],
    );
  }
}
