// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:suzanne_app/components/images/vertical_image_text.dart';
import 'package:suzanne_app/components/texts/section_heading.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: Colors.white,
          ),
          const SizedBox(height: 16.0),

          // Row with 3 categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              VerticalImageText(
                image: 'assets/icons/1.jpg',
                title: 'Events',
              ),
              VerticalImageText(
                image: 'assets/icons/2.jpg',
                title: 'Creatives',
              ),
              VerticalImageText(
                image: 'assets/icons/3.jpg',
                title: 'Podcast',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
