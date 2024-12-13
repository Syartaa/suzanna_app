import 'package:flutter/material.dart';
import 'package:suzanne_app/components/widgets/appbar.dart';
import 'package:suzanne_app/components/widgets/promo_banner.dart';
import 'package:suzanne_app/models/events.dart';
import 'package:suzanne_app/screens/events/widgets/event_card.dart';
import 'package:suzanne_app/screens/home/widgets/primary_header_container.dart';

class EventScreen extends StatelessWidget {
  final List<Event> events = [
    Event(
      title: 'Tech Conference 2024',
      date: 'March 5, 2024',
      image: 'assets/images/events/1.jpg',
      description:
          'Join us for an exciting tech conference featuring industry leaders.',
    ),
    Event(
      title: 'Flutter Workshop',
      date: 'April 12, 2024',
      image: 'assets/images/events/2.jpg',
      description:
          'A hands-on workshop to master Flutter for mobile development.',
    ),
    // Add more events as needed
  ];

  EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate dynamic aspect ratio for grid
    const int crossAxisCount = 2; // Two items in each row
    const double spacing = 16.0; // Horizontal/Vertical spacing
    final double cardWidth =
        (screenWidth - (crossAxisCount - 1) * spacing - 32) /
            crossAxisCount; // Subtract padding and spacing
    final double cardHeight = cardWidth * 1.38; // Height based on a 3/4 ratio
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
                          "Events",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  PromoBanner(
                    imagePath: 'assets/images/promo/promo2.jpg',
                    title: 'Events',
                    textColor: Colors.black,
                    buttonColor: Colors.orange,
                    onListenNowPressed: () {},
                    buttonTitle: 'Book Now',
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
                "Upcoming Events",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(144, 236, 66, 123)),
              ),
            ),
            const SizedBox(height: 16),
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
                itemCount: events.length, // The number of events
                itemBuilder: (context, index) {
                  final event = events[index]; // Get each event data
                  return EventCard(event: event); // Use EventCard widget
                },
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
