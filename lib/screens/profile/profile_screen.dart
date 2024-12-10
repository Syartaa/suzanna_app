import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:suzanne_app/components/widgets/appbar.dart';
import 'package:suzanne_app/screens/home/widgets/primary_header_container.dart';
import 'package:suzanne_app/screens/profile/widget/profile_options.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              height: 140,
              child: Column(
                children: [
                  // AppBar Section
                  SAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome, Syarta",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                color: Colors.white,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Let's explore the latest updates",
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Colors.white70,
                                  ),
                        ),
                      ],
                    ),
                    actions: [
                      IconButton(
                        icon: const Icon(Iconsax.notification,
                            color: Colors.white),
                        onPressed: () {
                          // Navigate to notifications
                        },
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            ),
            ProfileOption(
              title: "Chanage Profile ",
              onTap: () {},
            ),
            ProfileOption(
              title: "Chanage Password ",
              icon: Iconsax.password_check,
              onTap: () {},
            ),
            ProfileOption(
              icon: Icons.no_accounts_outlined,
              title: "Delete Account",
              onTap: () {},
            ),
            ProfileOption(
              icon: Iconsax.activity,
              title: "Activity",
              onTap: () {},
            ),
            ProfileOption(
              icon: Iconsax.logout,
              title: "Log out",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
