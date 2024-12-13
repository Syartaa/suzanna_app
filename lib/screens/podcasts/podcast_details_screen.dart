import 'package:flutter/material.dart';
import 'package:suzanne_app/components/widgets/appbar.dart';
import 'package:suzanne_app/screens/home/widgets/primary_header_container.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PodcastDetailsScreen extends StatefulWidget {
  final String title;
  final String url;

  const PodcastDetailsScreen(
      {super.key, required this.title, required this.url});

  @override
  State<PodcastDetailsScreen> createState() => _PodcastDetailsScreenState();
}

class _PodcastDetailsScreenState extends State<PodcastDetailsScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    //Extract the Youtube video ID from the URL
    String videoId = YoutubePlayer.convertUrlToId(widget.url) ?? '';

    //Initialize the Youtube player controller
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              height: 150,
              child: SAppBar(
                title: Text(widget.title),
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
