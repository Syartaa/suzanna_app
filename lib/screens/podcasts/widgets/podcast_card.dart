// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class PodcastCard extends StatelessWidget {
  const PodcastCard({
    super.key,
    required this.image,
    required this.title,
    required this.name,
    required this.podcast,
    required this.url,
  });

  final String image, title, name, podcast, url;

  // Function to launch the URL using the new API
  Future<void> _launchURL(String url) async {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7.0),
      child: Container(
        width: 190,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDA90A4), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image(image: AssetImage(image)),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 37, 37, 37)),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      podcast,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                    onPressed: () => _launchURL(url), icon: Icon(Iconsax.play)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
