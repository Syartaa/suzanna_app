import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzanne_app/components/widgets/appbar.dart';
import 'package:suzanne_app/components/widgets/promo_banner.dart';
import 'package:suzanne_app/providers/events_provider.dart';
import 'package:suzanne_app/screens/events/widgets/event_card.dart';
import 'package:suzanne_app/screens/home/widgets/primary_header_container.dart';

class EventScreen extends ConsumerWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsState = ref.watch(EventProvider);

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
                    title: Text(
                      "Events",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                    ),
                  ),
                  PromoBanner(
                    imagePath: 'assets/images/promo/promo2.jpg',
                    title: 'Events',
                    textColor: Colors.black,
                    buttonColor: Colors.orange,
                    onListenNowPressed: () {}, // Add action here.
                    buttonTitle: 'Book Now',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Text(
                "Upcoming Events",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(144, 236, 66, 123),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: eventsState.when(
                data: (events) => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.70, // Adjust this value as needed.
                  ),
                  itemCount: events.length,
                  itemBuilder: (context, index) =>
                      EventCard(event: events[index]),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stackTrace) => Center(
                  child: Text('Error: $error\nPlease try again.'),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
