import 'package:flutter/material.dart';

class GalleryWidget extends StatefulWidget {
  const GalleryWidget({super.key});

  @override
  State<GalleryWidget> createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
                child: Text(
              "Gallery",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary,
                padding: EdgeInsets.zero,
              ),
              onPressed: () {}, 
              child: const Text('View all'),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        const GalleryListBuilder(), 
      ],
    );
  }
}

class GalleryListBuilder extends StatelessWidget {
  const GalleryListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isMobile = size.width < 600;
    final childAspectRatio = isMobile ? size.width / 2 / 200 : size.width / 2 / 350;

    // Hardcoded gallery list
    final galleries = ["https://example.com/image1.jpg", "https://example.com/image2.jpg"];

    return GridView.builder(
      itemCount: galleries.length > 2 ? 2 : galleries.length,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        final gallery = galleries[index];
        return GestureDetector(
          onTap: () {
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Hero(
              tag: gallery,
              child: Image.asset(
                "assets/images/ecom.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
