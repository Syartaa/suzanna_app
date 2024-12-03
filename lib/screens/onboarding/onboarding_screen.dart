import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzanne_app/screens/onboarding/widget/onboarding_navigation.dart';
import 'package:suzanne_app/screens/onboarding/widget/onboarding_next_button.dart';
import 'package:suzanne_app/screens/onboarding/widget/onboarding_page.dart';
import 'package:suzanne_app/providers/onboarding_provider.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(onboardingStateProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              onBoardingPage(
                  image: 'assets/images/onboarding_images/1.gif',
                  title: 'Discover, Engage, and Empower',
                  subTitle:
                      'Your go-to platform for local events, podcasts, and creative industries in Albania and Kosovo.'),
              onBoardingPage(
                  image: 'assets/images/onboarding_images/2.gif',
                  title: 'Curated Events Just for You',
                  subTitle: 'Find and attend the best events in your region.'),
              onBoardingPage(
                  image: 'assets/images/onboarding_images/3.gif',
                  title: 'Tune into the Suzanne Podcast',
                  subTitle:
                      ' Stories, discussions, and empowerment for women everywhere.'),
            ],
          ),

          // Skip Button
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: () => controller.skipPage(),
              child: Text("Skip"),
            ),
          ),

          // Dot Navigation
          OnBoardingNavigation(),

          // Next Button
          OnBoardingNextButton()
        ],
      ),
    );
  }
}
