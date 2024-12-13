import 'package:flutter/material.dart';
import 'package:suzanne_app/models/events.dart';
import 'package:suzanne_app/screens/events/event_detail_screen.dart';
import 'package:iconsax/iconsax.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsive scaling
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventDetailScreen(event: event),
          ),
        );
      },
      child: Container(
        width: screenWidth * 0.45, // Adjust width based on screen size
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
                  event.image,
                  fit: BoxFit.cover, // Ensures the image covers the box
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event title (with truncation if it's long)
                  Text(
                    event.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1, // Limit title to 1 line
                    overflow: TextOverflow.ellipsis, // Truncate with ellipsis
                  ),
                  SizedBox(height: 4),
                  // Event date
                  Text(
                    event.date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                  SizedBox(height: 8),
                  // Row with "Book Now" text and calendar icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // "Book Now" text
                      Flexible(
                        child: Text(
                          "Book Now", // Or any relevant text for the event
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors
                                .blue, // Change the color to fit your theme
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1, // Limit to 1 line
                          overflow: TextOverflow.ellipsis, // Prevent overflow
                        ),
                      ),
                      // Calendar Icon Button
                      IconButton(
                        icon: Icon(Iconsax.calendar),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EventDetailScreen(
                                event: event,
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
