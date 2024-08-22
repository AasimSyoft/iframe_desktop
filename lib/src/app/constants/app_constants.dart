import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static var kDefaultShadowLight = [
    const BoxShadow(
      offset: Offset(0, 10),
      blurRadius: 30,
      color: Colors.black,
    ),
  ];

  static const Color kPrimaryColor = Color(0XFF3A776B);
  static const Color kCardColor = Color(0XFFF1F2F4);

  static const EdgeInsets kDefaultPadding = EdgeInsets.all(20);

  static var kDefaultShadow = [
    BoxShadow(
      offset: const Offset(0, 6),
      blurRadius: 20,
      color: Colors.black.withOpacity(0.06),
    ),
  ];

  static var kHoverShadow = [
    BoxShadow(
      offset: const Offset(0, 6),
      blurRadius: 20,
      color: Colors.teal.withOpacity(0.12),
    ),
  ];
}
