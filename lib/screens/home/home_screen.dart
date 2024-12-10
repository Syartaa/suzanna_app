import 'package:flutter/material.dart';
import 'package:suzanne_app/screens/home/widgets/content_slider.dart';
import 'package:suzanne_app/screens/home/widgets/home_header.dart';
import 'package:suzanne_app/screens/home/widgets/promo_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:suzanne_app/screens/events/event_screen.dart';
import 'package:suzanne_app/screens/podcasts/podcasts_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // URL list for events (example URLs, replace with actual URLs)
  final List<String> eventLinks = [
    'https://www.youtube.com/watch?v=nXs4UABX4Kc',
    'https://www.rave-travel.com/event-details-en.nspx?eventid=3828',
    'https://www.rave-travel.com/event-details-en.nspx?eventid=3828',
    'https://www.rave-travel.com/event-details-en.nspx?eventid=3828',
  ];

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

    // Function to launch the URL using the new API
    Future<void> launchURL(String url) async {
      final Uri uri = Uri.parse(url); // Convert string URL to Uri
      try {
        await launchUrl(uri,
            mode: LaunchMode
                .externalApplication); // Force opening in an external browser
      } catch (e) {
        print('Error launching URL: $e');
        throw 'Could not launch $url';
      }
    }

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
              const SizedBox(
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
                          onTap: () {
                            // Navigate to the Events screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EventScreen()),
                            );
                          },
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
                    items: eventItems,
                    height: 150,
                    padding: EdgeInsets.zero, // Ensure no internal padding
                    onItemTap: (index) {
                      print("Tapped event item at index: $index");
                      launchURL(eventLinks[index]);
                    },
                  ),
                ],
              ),
              const SizedBox(
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
                          onTap: () {
                            // Navigate to the Podcasts screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PodcastsScreen()),
                            );
                          },
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
