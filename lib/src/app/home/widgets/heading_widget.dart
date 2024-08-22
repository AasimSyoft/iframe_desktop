import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    super.key,
    this.component,
    this.style = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  });

  // Removed subHeadingComponent and its related constructor
  const HeadingWidget.subHeading({
    super.key,
    this.component,
    this.style = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  });

  final HeadingComponent? component;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    String greeting = 'Good Morning';
    if (now.hour >= 12 && now.hour < 17) {
      greeting = 'Good Afternoon';
    } else if (now.hour >= 17 && now.hour < 21) {
      greeting = 'Good Evening';
    }

    // Hardcoded text with a placeholder
    const text = 'Hello, {greeting}\nAasim!';

    return Text(
      text.replacePlaceholders({'greeting': greeting}),
      style: style,
    );
  }
}

// Placeholder for HeadingComponent class
class HeadingComponent {
  final String text;

  HeadingComponent({required this.text});
}

// Extension method to replace placeholders in strings
extension StringPlaceholders on String {
  String replacePlaceholders(Map<String, String> placeholders) {
    var result = this;
    placeholders.forEach((key, value) {
      result = result.replaceAll('{$key}', value);
    });
    return result;
  }
}
