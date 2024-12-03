import 'package:flutter/material.dart';
import 'package:suzanne_app/screens/home/widgets/content_slider.dart';
import 'package:suzanne_app/screens/home/widgets/home_header.dart';
import 'package:suzanne_app/screens/home/widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ContentSliderItem> eventItems = [
      ContentSliderItem(image: 'assets/images/events/1.jpg', title: 'Event 1'),
      ContentSliderItem(image: 'assets/images/events/2.jpg', title: 'Event 2'),
      ContentSliderItem(image: 'assets/images/events/3.jpg', title: 'Event 3'),
      ContentSliderItem(image: 'assets/images/events/4.jpg', title: 'Event 4'),
    ];

    final List<ContentSliderItem> podcastItems = [
      ContentSliderItem(
          image: 'assets/images/podcast/1.jpg', title: 'Podcast 1'),
      ContentSliderItem(
          image: 'assets/images/podcast/2.jpg', title: 'Podcast 2'),
      ContentSliderItem(
          image: 'assets/images/podcast/3.jpg', title: 'Podcast 3'),
      ContentSliderItem(
          image: 'assets/images/podcast/4.jpg', title: 'Podcast 4'),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.zero, // Ensure no default padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: PromoSlider(),
              ),
              SizedBox(
                height: 24.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Trending events",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "View all",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ContentSlider(
                    items: eventItems,
                    height: 150,
                    padding: EdgeInsets.zero, // Ensure no internal padding
                    onItemTap: (index) {
                      print("Tapped event item at index: $index");
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Trending podcast",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "View all",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ContentSlider(
                    items: podcastItems,
                    height: 200,
                    padding: EdgeInsets.zero,
                    onItemTap: (index) {
                      print("Tapped podcast item at index: $index");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
