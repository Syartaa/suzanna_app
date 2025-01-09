// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:suzanne_app/components/widgets/appbar.dart';
import 'package:suzanne_app/screens/home/widgets/category_section.dart';
import 'package:suzanne_app/screens/home/widgets/primary_header_container.dart';
import 'package:suzanne_app/screens/home/widgets/search_container.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryHeaderContainer(
      height: 130,
      child: Column(
        children: [
          // AppBar Section
          SAppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome, Syarta",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Let's explore the latest updates",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.white70,
                      ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Iconsax.notification, color: Colors.white),
                onPressed: () {
                  // Navigate to notifications
                },
              ),
              const SizedBox(width: 16),
            ],
          ),
          // const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}
