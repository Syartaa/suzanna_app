import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzanne_app/providers/podcast_provider.dart';
import 'package:suzanne_app/screens/podcasts/podcast_details_screen.dart';

class PodcastListScreen extends ConsumerWidget {
  const PodcastListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final podcastsAsyncValue = ref.watch(podcastProvider);

    // Get the screen dimensions
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate dynamic aspect ratio
    const int crossAxisCount = 2; // Two items in each row
    const double spacing = 16.0; // Horizontal/Vertical spacing
    final double cardWidth =
        (screenWidth - (crossAxisCount - 1) * spacing - 32) / crossAxisCount;
    final double cardHeight = cardWidth * 1.33; // Height based on the 3/4 ratio
    final double dynamicAspectRatio = cardWidth / cardHeight;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Podcasts"),
      ),
      body: podcastsAsyncValue.when(
        data: (podcasts) {
          if (podcasts.isEmpty) {
            return const Center(
              child: Text("No Podcasts found"),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              itemCount: podcasts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: dynamicAspectRatio,
              ),
              itemBuilder: (context, index) {
                final podcast = podcasts[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PodcastDetailsScreen(podcast: podcast),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: podcast['thumbnail'] != null
                              ? Image.network(
                                  podcast['thumbnail'].startsWith('http')
                                      ? podcast['thumbnail']
                                      : 'https://suzanne-podcast.laratest-app.com/${podcast['thumbnail']}',
                                  fit: BoxFit.cover,
                                )
                              : const Icon(Icons.podcasts, size: 50),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                podcast['title'] ?? 'No Title',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                podcast['short_description'] ??
                                    'No Description',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text("Error: ${error.toString()}"),
        ),
      ),
    );
  }
}
