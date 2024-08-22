import 'package:flutter/material.dart' hide Banner;
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded banner values
    final banners = [
      Banner(
        image: "assets/images/ecom.jpeg",
        size: 'medium',
        advanced: AdvancedBanner(
          heading: 'Welcome to Our Store!',
          subHeading: 'Check out our latest products',
          button: AdvancedBannerButton(label: 'Shop Now'),
          background: AdvancedBannerBackground(
            type: 'gradient',
            value: ['#ff7e5f', '#feb47b'],
          ),
        ),
      ),
      Banner(
        image: "assets/images/ecom.jpeg",
        size: 'large',
        advanced: AdvancedBanner(
          heading: 'Special Offers!',
          subHeading: 'Don’t miss out on our discounts',
          button: AdvancedBannerButton(label: 'Explore'),
          background: AdvancedBannerBackground(
            type: 'solid',
            value: ['#4facfe'],
          ),
        ),
      ),
    ];

    return _BannerCarousel(banners: banners);
  }
}

class _BannerCarousel extends StatefulWidget {
  final List<Banner> banners;
  const _BannerCarousel({required this.banners});

  @override
  State<_BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<_BannerCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isDesktop = getDeviceType(MediaQuery.sizeOf(context)) == DeviceScreenType.desktop;
    final bool isTablet = getDeviceType(MediaQuery.sizeOf(context)) == DeviceScreenType.tablet;

    final List<Banner> banners = widget.banners;
    String type = banners.first.size ?? 'small';

    double height;

    if (isTablet) {
      // Tablet or Web/Desktop
      height = type == 'small'
          ? size.height * 0.4
          : type == 'medium'
              ? size.height * 0.5
              : size.height * 0.6;
    } else {
      // Mobile
      height = type == 'small'
          ? size.width * 0.4
          : type == 'medium'
              ? size.width * 0.5
              : size.width * 0.6;
    }

    if (isDesktop) {
      return SizedBox(
        height: 200,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: banners.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: size.width * 0.4,
              child: Slider(banner: banners[index]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10.0),
        ),
      );
    }

    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height),
          child: PageView.builder(
            controller: _pageController,
            itemCount: banners.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Slider(banner: banners[index]),
              );
            },
            onPageChanged: (index) {
              _currentIndex.value = index;
            },
          ),
        ),
        const SizedBox(height: 10.0),
        if (banners.length > 1)
          ValueListenableBuilder<int>(
            valueListenable: _currentIndex,
            builder: (context, index, child) {
              return AnimatedSmoothIndicator(
                activeIndex: index,
                count: banners.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 5,
                  dotWidth: 5,
                  activeDotColor: Theme.of(context).colorScheme.primary,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
              );
            },
          ),
      ],
    );
  }
}

class Slider extends StatelessWidget {
  final Banner banner;
  const Slider({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    if (banner.image == null || banner.image!.isEmpty) {
      return _AdvancedBanner(banner);
    }
    return _ImageSlider(banner);
  }
}

class _ImageSlider extends StatelessWidget {
  final Banner banner;
  const _ImageSlider(this.banner);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle navigation
      },
      borderRadius: BorderRadius.circular(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          "assets/images/ecom.jpeg",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _AdvancedBanner extends StatelessWidget {
  final Banner banner;
  const _AdvancedBanner(this.banner);

  bool get isSolid => banner.advanced?.background?.type == 'solid';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: isSolid ? banner.advanced!.background!.value.first.toColor() : null,
        gradient: !isSolid
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: banner.advanced!.background!.value.map((e) => e.toColor()).length == 1
                    ? [
                        banner.advanced!.background!.value.first.toColor(),
                        banner.advanced!.background!.value.first.toColor(),
                      ]
                    : banner.advanced!.background!.value.map((e) => e.toColor()).toList(),
              )
            : null,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (banner.advanced?.heading != null)
            Text(
              banner.advanced!.heading!,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          if (banner.advanced?.subHeading != null) ...[
            const SizedBox(height: 5),
            Text(
              banner.advanced!.subHeading!,
              style: theme.textTheme.titleSmall,
              maxLines: 1,
            ),
            if (banner.advanced?.button != null) ...[
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(0, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: () {
                    // Handle button press
                  },
                  child: Text(banner.advanced!.button?.label ?? ''),
                ),
              )
            ]
          ],
        ],
      ),
    );
  }
}

class Banner {
  final String? image;
  final String? size;
  final AdvancedBanner? advanced;

  Banner({
    this.image,
    this.size,
    this.advanced,
  });
}

class AdvancedBanner {
  final String? heading;
  final String? subHeading;
  final AdvancedBannerButton? button;
  final AdvancedBannerBackground? background;

  AdvancedBanner({
    this.heading,
    this.subHeading,
    this.button,
    this.background,
  });
}

class AdvancedBannerButton {
  final String? label;

  AdvancedBannerButton({this.label});
}

class AdvancedBannerBackground {
  final String type;
  final List<String> value;

  AdvancedBannerBackground({
    required this.type,
    required this.value,
  });
}

extension ColorExtension on String {
  Color toColor() {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) buffer.write('ff');
    buffer.write(replaceAll('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
