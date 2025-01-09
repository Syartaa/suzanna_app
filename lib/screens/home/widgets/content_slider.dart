import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suzanne_app/providers/podcast_provider.dart';
import 'package:suzanne_app/screens/home/widgets/trending_images.dart';

class ContentSliderItem {
  final String image;
  final String title;
  final String hostName;

  ContentSliderItem({
    required this.image,
    required this.title,
    required this.hostName,
  });
}

class ContentSlider extends ConsumerWidget {
  const ContentSlider({
    super.key,
    this.height = 100,
    this.padding,
    this.onItemTap,
    required List<ContentSliderItem> items,
  });

  final double height;
  final EdgeInsetsGeometry? padding;
  final void Function(int)? onItemTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final podcastState = ref.watch(podcastProvider);

    return podcastState.when(
      data: (podcasts) {
        final items = podcasts.map<ContentSliderItem>((podcast) {
          final imageUrl = podcast['thumbnail']?.startsWith('http') ?? false
              ? podcast['thumbnail']
              : 'https://suzanne-podcast.laratest-app.com/${podcast['thumbnail']}';
          return ContentSliderItem(
            image: imageUrl,
            title: podcast['title'] ?? 'No Title',
            hostName: podcast['host_name'] ?? 'Unknown Host',
          );
        }).toList();

        return Padding(
          padding: padding ?? EdgeInsets.zero,
          child: SizedBox(
            height: height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: onItemTap != null ? () => onItemTap!(index) : null,
                  child: TrendingImages(
                    image: item.image,
                    title: '${item.title}\nHost: ${item.hostName}',
                  ),
                );
              },
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
