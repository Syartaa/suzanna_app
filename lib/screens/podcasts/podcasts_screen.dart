// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:suzanne_app/components/widgets/appbar.dart';
import 'package:suzanne_app/screens/home/widgets/primary_header_container.dart';
import 'package:suzanne_app/screens/podcasts/widgets/podcast_card.dart';
import 'package:suzanne_app/screens/podcasts/widgets/promo_podcast.dart';

class PodcastsScreen extends StatelessWidget {
  const PodcastsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryHeaderContainer(
              height: 430,
              child: Column(
                children: [
                  SAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Podcats",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  PromoPodcast(),
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                "Recent Podcast",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 236, 66, 123)),
              ),
            ),
            GridView.builder(
              physics:
                  NeverScrollableScrollPhysics(), // Disable scrolling for GridView
              shrinkWrap:
                  true, // Allow GridView to fit within SingleChildScrollView
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 5, // Spacing between columns
                mainAxisSpacing: 10, // Spacing between rows
                childAspectRatio:
                    0.69, // Adjust this ratio based on card design
              ),
              itemCount: 3, // Number of cards
              itemBuilder: (context, index) {
                return PodcastCard(
                  title: 'Life is more youthful',
                  image: 'assets/images/podcast/2.jpg',
                  name: 'Mariana Jane',
                  podcast: 'Podcastly',
                  url: 'https://www.youtube.com/watch?v=q1I77BC0BeA',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
