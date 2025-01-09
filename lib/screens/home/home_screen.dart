import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzanne_app/providers/podcast_provider.dart';
import 'package:suzanne_app/screens/home/widgets/content_slider.dart';
import 'package:suzanne_app/screens/home/widgets/home_header.dart';
import 'package:suzanne_app/screens/home/widgets/promo_slider.dart';
import 'package:suzanne_app/screens/podcasts/podcasts_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final podcastState =
        ref.watch(podcastProvider); // Watch the podcastProvider

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
              //
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
                                  builder: (context) =>
                                      const PodcastListScreen()),
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
                  podcastState.when(
                    data: (podcasts) {
                      // Map podcast data to ContentSliderItem list
                      final items = podcasts.map<ContentSliderItem>((podcast) {
                        return ContentSliderItem(
                          image: podcast[
                              'thumbnail'], // Replace with correct field
                          title: podcast['title'],
                          hostName: podcast[
                              'host_name'], // Replace with correct field
                        );
                      }).toList();

                      return ContentSlider(
                        items: items,
                        height: 200,
                        padding: EdgeInsets.zero,
                        onItemTap: (index) {
                          print("Tapped podcast item at index: $index");
                        },
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stack) => Center(
                      child: Text('Error: $error'),
                    ),
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
