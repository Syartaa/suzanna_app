import 'package:flutter/material.dart';
import 'package:suzanne_app/screens/podcasts/podcast_details_screen.dart';
import 'package:iconsax/iconsax.dart';

class PodcastCard extends StatelessWidget {
  final String title;
  final String image;
  final String name;
  final String podcast;
  final String url;
  final double width;

  const PodcastCard({
    super.key,
    required this.title,
    required this.image,
    required this.name,
    required this.podcast,
    required this.url,
    this.width = 150, // Default width
  });

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive scaling
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Navigate to PodcastDetailsScreen when the user taps the podcast card
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PodcastDetailsScreen(
              title: title,
              url: url,
            ),
          ),
        );
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dynamic height for the image
            SizedBox(
              height:
                  screenWidth * 0.3, // Dynamically adjust based on screen width
              width: double.infinity, // Match the width of the container
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover, // Ensures the image covers the box
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'By $name',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          podcast,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Iconsax.play),
                        onPressed: () {
                          // Navigate to PodcastDetailsScreen when Play button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PodcastDetailsScreen(
                                title: title,
                                url: url,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
