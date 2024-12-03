import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzanne_app/components/containers/circular_container.dart';
import 'package:suzanne_app/components/images/rounded_image.dart';

final carouselIndexProvider = StateProvider<int>((ref) => 0);

class PromoSlider extends ConsumerWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the carousel index state from Riverpod
    final carouselCurrentIndex = ref.watch(carouselIndexProvider);
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              // Update the carousel index when the page changes
              ref.read(carouselIndexProvider.notifier).state = index;
            },
          ),
          items: const [
            RoundedImage(imageUrl: "assets/images/promo/1.jpg"),
            RoundedImage(imageUrl: "assets/images/promo/2.jpg"),
            RoundedImage(imageUrl: "assets/images/promo/1.jpg")
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              CircularContainer(
                width: 20,
                height: 4,
                backgroundColor:
                    carouselCurrentIndex == i ? Color(0xFFDA90A4) : Colors.grey,
                margin: const EdgeInsets.only(right: 10),
              ),
          ],
        ),
      ],
    );
  }
}
