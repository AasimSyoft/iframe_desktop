import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iframe_desktop/src/app/user_profile/presentation/user_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../root/presentation/root_view.dart';

class UserWrapper extends ConsumerWidget {
  final Widget child;

  const UserWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenTypeLayout.builder(
      desktop: (context) => Row(
        children: [
          const Expanded(
            child: UserProfileView(),
          ),
          const VerticalDivider(),
          Expanded(flex: 4, child: child)
        ],
      ),
      tablet: (context) => const RootViewWidget(),
      mobile: (BuildContext context) => const SizedBox(child: RootViewWidget()),
    );
  }
}
