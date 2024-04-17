import 'package:afsoen/features/reels/views/widgets/reels_details_icons.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ReelsContent extends StatefulWidget {
  const ReelsContent(
    this.src, {
    super.key,
  });

  final Uri src;

  @override
  State<ReelsContent> createState() => _ReelsContentState();
}

class _ReelsContentState extends State<ReelsContent> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.networkUrl(widget.src);
    await Future.wait([_videoPlayerController!.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      showControls: false,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // width: double.infinity,
        _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized ? Chewie(controller: _chewieController!) : const Center(child: CircularProgressIndicator.adaptive()),
        const ReelsDetailsAndIcons("duluyTee", "Great day in the metaverse", "music")
      ],
    );
  }
}
