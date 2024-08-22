import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({super.key});

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> with AutomaticKeepAliveClientMixin {
  final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    if (MediaQuery.of(context).size.width >= 600) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: Text('something')),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: const Text('View all'),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.45,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemBuilder: (context, index) {
                const cardWidthFactor = 0.66;
                // Feed feed = state[index];
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5 * cardWidthFactor,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300, width: 0.5),
                    // boxShadow: AppConstants.kDefaultShadow,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                          radius: 16,
                          child: Text(
                            'Aasim',
                            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          'Aasim bhat',
                          style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: const Text('1hr ago'),
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                        dense: true,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: ExpandableText(
                          text: 'this i a content',
                          style: theme.textTheme.bodySmall!,
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          constraints: BoxConstraints(maxHeight: size.width * 0.3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/ecom.jpeg",
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Row(
                        children: [
                          LikeButton(size: 20, likeCount: 19),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(child: Text('Feed')),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: const Text('View all'),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Container(    
            height: MediaQuery.of(context).size.height * 0.55,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300, width: 0.5),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
                    radius: 16,
                    child: Image.asset(
                      "assets/images/ecom.jpeg",
                      width: 32,
                      height: 32,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    'Aasim bhat',
                    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('1hr ago'),
                  contentPadding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  dense: true,
                ),
                GestureDetector(
                  onTap: () {},
                  child: ExpandableText(
                    text:
                        "“Life is like a box of chocolates; sometimes you just dig out the good center parts and leave all the undesirable rest to waste.”",
                    style: theme.textTheme.bodySmall!,
                    maxLines: 3,
                  ),
                ),
                const SizedBox(height: 10),
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: size.height * 0.33,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      _currentIndex.value = index;
                    },
                  ),
                  items: [
                    Image.asset("assets/images/ecom.jpeg", fit: BoxFit.cover, width: double.infinity),
                    Image.asset("assets/images/ecom.jpeg", fit: BoxFit.cover, width: double.infinity),
                    Image.asset("assets/images/ecom.jpeg", fit: BoxFit.cover, width: double.infinity),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    LikeButton(
                        onTap: (isLiked) async {
                          return null;
                        },
                        size: 20,
                        likeCount: 18),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      );
    }
  }
}

class ExpandableText extends StatelessWidget {
  const ExpandableText({
    super.key,
    required this.text,
    required this.style,
    this.maxLines = 2,
  });

  final int maxLines;
  final TextStyle style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textPainter = TextPainter(
          text: TextSpan(
            text: text,
            style: style,
          ),
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final textExceedsMaxLines = textPainter.didExceedMaxLines;

        return RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: textExceedsMaxLines
                    ? '${text.substring(0, textPainter.getPositionForOffset(Offset(constraints.maxWidth, textPainter.height - style.fontSize! * 1.5)).offset)}... '
                    : text,
                style: style,
              ),
              if (textExceedsMaxLines)
                TextSpan(
                  text: 'Show more',
                  style: style.copyWith(color: Colors.blue),
                ),
            ],
          ),
        );
      },
    );
  }
}
