import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.image,
    required this.title,
    required this.organizerName,
    required this.eventType,
    required this.url,
  });

  final String image, title, organizerName, eventType, url;

  // Function to launch the URL using the new API
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url); // Convert string URL to Uri
    try {
      await launchUrl(
        uri,
        mode: LaunchMode
            .externalApplication, // Force opening in an external browser
      );
    } catch (e) {
      print('Error launching URL: $e');
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 180,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDA90A4), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120, // Fixed height for the image
              width: double.infinity, // Matches parent width
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover, // Ensures the image covers the space
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            Text(
              organizerName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            Text(
              eventType,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => _launchURL(url),
                icon: Icon(Iconsax.play_circle, color: Colors.pinkAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
