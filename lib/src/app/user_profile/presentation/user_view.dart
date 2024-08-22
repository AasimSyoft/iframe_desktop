import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iframe_desktop/src/app/routes/app_router.dart';

import '../data/models/sidebar.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Sidebar(),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  Sidebar({super.key});

  final List<SidebarItem> _items = [
    SidebarItem(
        icon: HugeIcons.strokeRoundedUser,
        title: "My Profile",
        route: Routes.editProfile,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
    SidebarItem(
        icon: HugeIcons.strokeRoundedCalendar03,
        title: "Appointments",
        route: Routes.appoitments,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
    SidebarItem(
        icon: HugeIcons.strokeRoundedFile01,
        title: "Files",
        route: Routes.myFiles,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
    SidebarItem(
        icon: HugeIcons.strokeRoundedHelpCircle,
        title: "Enquiries",
        route: Routes.myEnquiry,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
    SidebarItem(
        icon: HugeIcons.strokeRoundedService,
        title: "Services",
        route: Routes.services,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
    SidebarItem(
        icon: HugeIcons.strokeRoundedVideo01,
        title: "Meetings",
        route: Routes.meetings,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
    SidebarItem(
        icon: HugeIcons.strokeRoundedChatting01,
        title: "Messages",
        route: Routes.cart,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
    SidebarItem(
        icon: HugeIcons.strokeRoundedShoppingCart01,
        title: "Cart",
        route: Routes.cart,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
    SidebarItem(
        icon: HugeIcons.strokeRoundedShoppingBag02,
        title: "My Orders",
        route: Routes.orders,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
    SidebarItem(
        icon: HugeIcons.strokeRoundedLocation01,
        title: "Manage Address",
        route: Routes.manageAddress,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
    SidebarItem(
        icon: HugeIcons.strokeRoundedLogout01,
        title: "Logout",
        route: Routes.cart,
        additionalIcon: HugeIcons.strokeRoundedArrowRight01),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: _items.map((item) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.go(item.route);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              item.icon,
                              size: 15,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              item.title,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const Spacer(),
                            Icon(
                              item.additionalIcon,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
