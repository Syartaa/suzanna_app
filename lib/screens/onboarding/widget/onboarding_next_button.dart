import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzanne_app/providers/onboarding_provider.dart';

class OnBoardingNextButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingStateProvider);
    final controller = ref.read(onboardingStateProvider.notifier);

    return Positioned(
      bottom: 40,
      right: 20,
      child: ElevatedButton(
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: Theme.of(context).colorScheme.primary,
        // ),

        onPressed: () {
          controller
              .nextPage(); // This will update the page and move to the next one
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            onboardingState.currentPageIndex == 2 ? 'Get Started' : 'Next',
            style: TextStyle(color: const Color.fromARGB(255, 250, 249, 249)),
          ),
        ),
      ),
    );
  }
}
