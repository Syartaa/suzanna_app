import 'package:flutter/material.dart';
import 'package:suzanne_app/models/podcasts.dart';

class PodcastProvider extends ChangeNotifier {
  // List of podcasts
  List<Podcast> _podcasts = [];

  // Getter to fetch podcasts
  List<Podcast> get podcasts => _podcasts;

  // Method to set the list of podcasts
  void setPodcasts(List<Podcast> podcasts) {
    _podcasts = podcasts;
    notifyListeners(); // Notify listeners when the data changes
  }

  // Example method to simulate fetching data
  Future<void> fetchPodcasts() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate a delay

    // A sample list of podcasts (replace this with actual API data if needed)
    _podcasts = [
      Podcast(
        image: 'assets/images/podcast/2.jpg',
        title: 'Life is more youthful',
        name: 'Mariana Jane',
        podcast: 'Podcastly',
        url: 'https://www.youtube.com/watch?v=q1I77BC0BeA',
      ),
      Podcast(
        image: 'assets/images/podcast/3.jpg',
        title: 'Growth Mindset',
        name: 'John Doe',
        podcast: 'Mindset Show',
        url: 'https://www.youtube.com/watch?v=xyz123',
      ),
      // Add more podcasts here
    ];

    notifyListeners(); // Notify listeners after fetching data
  }
}
