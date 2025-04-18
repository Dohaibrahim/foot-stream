import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key, required this.videoUrl});
  final String videoUrl;
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late YoutubePlayerController _controller;
  late String? videoId;
  //String? videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
  @override
  void initState() {
    super.initState();
    // Ensure other audio sources (like TTS) continue playing
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId:
          videoId ??
          'nTDqw140q-E', //'nTDqw140q-E', // Extracted YouTube video ID
      flags: YoutubePlayerFlags(autoPlay: true, mute: false, loop: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: YoutubePlayer(
        key: UniqueKey(),
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(isExpanded: true),
          //PlaybackSpeedButton(),
          // No FullscreenButton here (removes the rotate/fullscreen button)
        ],
      ),
    );
  }
}
