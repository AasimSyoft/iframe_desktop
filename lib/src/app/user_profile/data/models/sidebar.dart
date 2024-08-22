// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class SidebarItem {
  final IconData icon;
  final IconData? additionalIcon;
  final String title;
  final String route; 

  const SidebarItem({
    required this.icon,
    this.additionalIcon,
    required this.title,
    required this.route,
  });

  SidebarItem copyWith({
    IconData? icon,
    IconData? additionalIcon,
    String? title,
    String? route,
  }) {
    return SidebarItem(
      icon: icon ?? this.icon,
      additionalIcon: additionalIcon ?? this.additionalIcon,
      title: title ?? this.title,
      route: route ?? this.route,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'icon': icon.codePoint,
      'additionalIcon': additionalIcon?.codePoint,
      'title': title,
      'route': route,
    };
  }

  factory SidebarItem.fromMap(Map<String, dynamic> map) {
    return SidebarItem(
      icon: IconData(map['icon'] as int, fontFamily: 'MaterialIcons'),
      additionalIcon: map['additionalIcon'] != null ? IconData(map['additionalIcon'] as int, fontFamily: 'MaterialIcons') : null,
      title: map['title'] as String,
      route: map['route'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SidebarItem.fromJson(String source) => SidebarItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SidebarItem(icon: $icon, additionalIcon: $additionalIcon, title: $title, route: $route)';
  }

  @override
  bool operator ==(covariant SidebarItem other) {
    if (identical(this, other)) return true;

    return other.icon == icon && other.additionalIcon == additionalIcon && other.title == title && other.route == route;
  }

  @override
  int get hashCode {
    return icon.hashCode ^ additionalIcon.hashCode ^ title.hashCode ^ route.hashCode;
  }
}

List<Map<String, dynamic>> meetings = [
  {'staffName': 'John Doe', 'bookingName': 'Project Meeting', 'date': DateTime.now()},
  {'staffName': 'Jane Smith', 'bookingName': 'Client Discussion', 'date': DateTime.now().add(const Duration(days: 1))},
];
