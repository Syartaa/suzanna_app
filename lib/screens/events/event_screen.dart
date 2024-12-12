import 'package:flutter/material.dart';
import 'package:suzanne_app/components/widgets/appbar.dart';
import 'package:suzanne_app/components/widgets/promo_banner.dart';
import 'package:suzanne_app/screens/events/widgets/event_card.dart';
import 'package:suzanne_app/screens/home/widgets/primary_header_container.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryHeaderContainer(
              height: 420,
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
                      buttonTitle: 'Book Now')
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                "Recent Events",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(144, 236, 66, 123)),
              ),
            ),
            GridView.builder(
              physics:
                  const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
              shrinkWrap:
                  true, // Allow GridView to fit within SingleChildScrollView
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 4, // Spacing between columns
                mainAxisSpacing: 10, // Spacing between rows
                childAspectRatio:
                    0.71, // Adjust this ratio based on card design
              ),
              itemCount: 6, // Number of cards
              itemBuilder: (context, index) {
                return const EventCard(
                  title: 'Life is more youthful',
                  image: 'assets/images/events/3.jpg',
                  url:
                      'https://www.rave-travel.com/event-details-en.nspx?eventid=3830',
                  organizerName: 'Mariana Jane',
                  eventType: 'Events',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
