import 'package:flutter/material.dart';
import 'package:suzanne_app/screens/home/widgets/trending_images.dart';

// Define a model to represent each item
class ContentSliderItem {
  final String image;
  final String title;

  ContentSliderItem({required this.image, required this.title});
}

class ContentSlider extends StatelessWidget {
  const ContentSlider(
      {super.key,
      required this.items,
      this.height = 100,
      this.padding,
      this.onItemTap});

  final List<ContentSliderItem> items; // List of items to display
  final double height; // Height of the ContentSlider
  final EdgeInsetsGeometry? padding; // Optional padding
  final void Function(int)? onItemTap; // Optional callback for tapping an item

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero, // Use custom padding if provided
      child: SizedBox(
        height: height, // Set the height of the ContentSlider
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length, // Dynamically set the number of items
          itemBuilder: (context, index) {
            final item = items[index]; // Get the current item

            return GestureDetector(
              onTap: onItemTap != null
                  ? () => onItemTap!(index)
                  : null, // Handle item tap if callback is provided
              child: TrendingImages(
                image: item.image,
                title: item.title,
              ),
            );
          },
        ),
      ),
    );
    ;
  }
}
