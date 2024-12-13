import 'package:flutter/material.dart';
import 'package:suzanne_app/data/podcast_dummydata.dart';
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
    await Future.delayed(const Duration(seconds: 2)); // Simulate a delay

    // A sample list of podcasts (replace this with actual API data if needed)
    _podcasts = dummyPodcasts;

    notifyListeners(); // Notify listeners after fetching data
  }
}
