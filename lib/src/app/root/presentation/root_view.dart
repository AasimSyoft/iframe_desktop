import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iframe_desktop/src/app/home/presentation/home_view.dart';
import 'package:iframe_desktop/src/app/root/presentation/drawer_widget.dart';
import 'package:iframe_desktop/src/features/product/presentation/product_view.dart';

import '../../user_profile/presentation/widgets/user_view_tab_mobile_widget.dart';
import 'providers/root_provider.dart';

class RootViewWidget extends ConsumerWidget {
  const RootViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    final List<Widget> screens = [
      const HomeView(),
      const ProductScreen(),
      const UserViewTabMobileWidget(),
    ];

    return Scaffold(
      appBar: currentIndex != 0 && currentIndex != 2
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : null,
      drawer: currentIndex != 2 && currentIndex != 0 ? const DrawerWidget() : null,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(HugeIcons.strokeRoundedHome01),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(HugeIcons.strokeRoundedCalendar01),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(HugeIcons.strokeRoundedUser),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
