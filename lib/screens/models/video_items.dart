import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;
   VideoItems({
    required this.videoPlayerController,
    required this.looping, required this.autoplay,
  });

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    widget.videoPlayerController.addListener(checkVideo);
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio:5/8,
      autoInitialize: true,
      autoPlay: widget.autoplay,
      looping: true,
      allowMuting: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 400,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Chewie(
                controller: _chewieController,
              ),
            )
        ),
      ),
    );
  }
  void checkVideo(){
    // Implement your calls inside these conditions' bodies :
    /*if(widget.videoPlayerController.value.position == Duration(seconds: 0, minutes: 0, hours: 0)) {
      print('video Started');
    }*/

    if(widget.videoPlayerController.value.position == widget.videoPlayerController.value.duration) {
      print("Video Status " + widget.videoPlayerController.value.duration.toString());
    }

  }
}