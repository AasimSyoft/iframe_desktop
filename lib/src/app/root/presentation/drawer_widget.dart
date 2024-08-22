import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  DrawerHeader _buildDrawerHeader(ThemeData theme, BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(color: theme.colorScheme.primary),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Welcome to the Organization',
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: 40.0,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigate to the login screen or perform login action
                    },
                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildDrawerTile({
    required String title,
    String? subtitle,
    Function()? onTap,
    Color? color,
  }) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: color ?? Colors.black),
        maxLines: 1,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            )
          : null,
      trailing: Icon(Icons.arrow_forward_ios, size: 16.0, color: color ?? Colors.grey),
      onTap: onTap,
      visualDensity: const VisualDensity(vertical: -4),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          _buildDrawerHeader(theme, context),
          const SizedBox(height: 10.0),
          Column(
            children: [
              _buildDrawerTile(
                title: 'Home',
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigate to home
                },
              ),
              _buildDrawerTile(
                title: 'Profile',
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigate to profile
                },
              ),
              _buildDrawerTile(
                title: 'Settings',
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigate to settings
                },
              ),
              _buildDrawerTile(
                title: 'Logout',
                color: Colors.red,
                onTap: () {
                  Navigator.of(context).pop();
                  // Perform logout
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
