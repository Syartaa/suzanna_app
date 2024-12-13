import 'package:flutter/material.dart';
import 'package:suzanne_app/components/widgets/appbar.dart';
import 'package:suzanne_app/screens/home/widgets/primary_header_container.dart';
import 'package:suzanne_app/screens/podcasts/widgets/podcast_card.dart';
import 'package:suzanne_app/components/widgets/promo_banner.dart';

class PodcastsScreen extends StatelessWidget {
  const PodcastsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate dynamic aspect ratio
    const int crossAxisCount = 2; // Two items in each row
    const double spacing = 16.0; // Horizontal/Vertical spacing
    final double cardWidth =
        (screenWidth - (crossAxisCount - 1) * spacing - 32) /
            crossAxisCount; // Subtract padding and spacing
    final double cardHeight = cardWidth * 1.33; // Height based on the 3/4 ratio
    final double dynamicAspectRatio = cardWidth / cardHeight;

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
                          "Podcasts",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  PromoBanner(
                    imagePath: 'assets/images/promo/promo.jpg',
                    title: 'Podcast House',
                    onListenNowPressed: () {},
                    buttonTitle: 'Listen Now',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                "Recent Podcast",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(144, 236, 66, 123),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true, // Adjust height to content
                physics:
                    const NeverScrollableScrollPhysics(), // Avoid scrolling inside ScrollView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  childAspectRatio: dynamicAspectRatio, // Dynamic aspect ratio
                ),
                itemCount: 4, // Total items
                itemBuilder: (context, index) {
                  // Podcast data
                  final podcasts = [
                    {
                      'title': 'Life is more youthful',
                      'image': 'assets/images/podcast/2.jpg',
                      'name': 'Mariana Jane',
                      'podcast': 'Podcastly',
                      'url': 'https://www.youtube.com/watch?v=q1I77BC0BeA',
                    },
                    {
                      'title': 'The Great Adventure',
                      'image': 'assets/images/podcast/3.jpg',
                      'name': 'John Doe',
                      'podcast': 'Podcastly',
                      'url': 'https://www.youtube.com/watch?v=q1I77BC0BeA',
                    },
                    {
                      'title': 'Stay Positive',
                      'image': 'assets/images/podcast/2.jpg',
                      'name': 'Emily Jones',
                      'podcast': 'Podcastly',
                      'url': 'https://www.youtube.com/watch?v=q1I77BC0BeA',
                    },
                    {
                      'title': 'Mindful Moments',
                      'image': 'assets/images/podcast/1.jpg',
                      'name': 'David Lee',
                      'podcast': 'Podcastly',
                      'url': 'https://www.youtube.com/watch?v=q1I77BC0BeA',
                    },
                  ];

                  final podcast = podcasts[index];
                  return PodcastCard(
                    title: podcast['title']!,
                    image: podcast['image']!,
                    name: podcast['name']!,
                    podcast: podcast['podcast']!,
                    url: podcast['url']!,
                    width: cardWidth, // Adjusted to grid layout
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
