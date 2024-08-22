import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class UserViewTabMobileWidget extends StatefulWidget {
  const UserViewTabMobileWidget({super.key});

  @override
  State<UserViewTabMobileWidget> createState() => _UserViewTabMobileWidgetState();
}

class _UserViewTabMobileWidgetState extends State<UserViewTabMobileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(97, 238, 235, 235),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('My Profile', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        actions: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to Edit Profile
              },
              label: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(
                Icons.edit,
                size: 17,
                color: Colors.white,
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Column(
            children: [
              Divider(height: 0, thickness: 1, color: Colors.grey.shade300),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        const SizedBox(height: 20),
        const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.brown,
            foregroundColor: Colors.white,
            child: HugeIcon(icon: HugeIcons.strokeRoundedUser, color: Colors.white)),
        const SizedBox(height: 10),
        const Text('User Name', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 3),
        const Text('user@example.com', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 4,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 1.9,
          ),
          children: const [
            GridListTile(
              title: 'My Appointments',
              icon: HugeIcons.strokeRoundedCalendar03,
              route: '/appointments',
            ),
            GridListTile(
              title: 'My Files',
              icon: HugeIcons.strokeRoundedFile01,
              route: '/files',
            ),
            GridListTile(
              title: 'My Enquiries',
              icon: HugeIcons.strokeRoundedHelpCircle,
              route: '/enquiries',
            ),
            GridListTile(
              title: 'My Services',
              icon: HugeIcons.strokeRoundedService,
              route: '/services',
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                ListTileWidget(
                    title: 'My Meetings',
                    icon: HugeIcons.strokeRoundedVideo01,
                    route: '/meetings',
                    additionalIcon: HugeIcons.strokeRoundedArrowRight01),
                ListTileWidget(
                    title: 'Messages',
                    icon: HugeIcons.strokeRoundedChatting01,
                    route: '/messages',
                    additionalIcon: HugeIcons.strokeRoundedArrowRight01),
                ListTileWidget(
                    title: 'Manage Address',
                    icon: HugeIcons.strokeRoundedLocation01,
                    route: '/address',
                    additionalIcon: HugeIcons.strokeRoundedArrowRight01),
                ListTileWidget(
                    title: 'My Orders',
                    icon: HugeIcons.strokeRoundedShoppingBag02,
                    route: '/address',
                    additionalIcon: HugeIcons.strokeRoundedArrowRight01),
                ListTileWidget(
                    title: 'Logout',
                    icon: HugeIcons.strokeRoundedLogout01,
                    route: '/logout',
                    additionalIcon: HugeIcons.strokeRoundedArrowRight01),
              ],
            ),
          ),
        ),
      ])),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final IconData additionalIcon;
  final String? route;

  const ListTileWidget({
    super.key,
    required this.title,
    required this.icon,
    this.route,
    required this.additionalIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null) {}
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const Spacer(),
            Icon(
              additionalIcon,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}

class GridListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? route;

  const GridListTile({
    super.key,
    required this.title,
    required this.icon,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          // context.go(route)
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                )),
          ],
        ),
      ),
    );
  }
}
