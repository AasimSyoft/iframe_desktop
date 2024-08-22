import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Products',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12.0),
        ProductListBuilder(products: _getDummyProducts(), type: 'product'),
      ],
    );
  }

  // Dummy products data
  List<Product> _getDummyProducts() {
    return List.generate(
      5,
      (index) => Product(
        id: 'product_$index',
        name: 'Product $index',
        image: "assets/images/ecom.jpeg",
        price: (index + 1) * 10.0,
      ),
    );
  }
}

class ProductListBuilder extends StatelessWidget {
  final String type;
  final List<Product> products;
  ProductListBuilder({super.key, required this.products, required this.type});

  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1024;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: isMobile ? _buildCarouselSlider() : _buildListView(),
        ),
        const SizedBox(height: 10.0),
        if (isMobile && products.length > 1)
          Center(
            child: ValueListenableBuilder<int>(
              valueListenable: _currentIndex,
              builder: (context, index, child) {
                return AnimatedSmoothIndicator(
                  activeIndex: index,
                  count: products.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 5,
                    dotWidth: 5,
                    activeDotColor: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      items: products
          .map((product) => ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ProductCard(
                  product: product,
                  tag: type,
                ),
              ))
          .toList(),
      options: CarouselOptions(
        viewportFraction: 1,
        height: 220,
        enableInfiniteScroll: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 7),
        onPageChanged: (index, reason) {
          _currentIndex.value = index;
        },
      ),
    );
  }

  Widget _buildListView() {
    return Builder(
      builder: (context) {
        final screenWidth = MediaQuery.of(context).size.width;
        final cardWidth = (screenWidth * 0.78) / 2;

        return SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16.0),
            itemBuilder: (context, index) {
              return SizedBox(
                width: cardWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ProductCard(
                    product: products[index],
                    tag: type,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class Product {
  final String id;
  final String name;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  static fromJson(item) {}
}

class ProductCard extends StatelessWidget {
  final Product product;
  final String tag;

  const ProductCard({
    super.key,
    required this.product,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.image, fit: BoxFit.cover, height: 128, width: double.infinity),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
