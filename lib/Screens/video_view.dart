
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViewScreen extends StatefulWidget {
  const VideoViewScreen({super.key, required this.path});
  final String path;

  @override
  State<VideoViewScreen> createState() => _VideoViewScreenState();
}

class _VideoViewScreenState extends State<VideoViewScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture; // Add this line

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(
      File(widget.path),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  // late VideoPlayerController _controller;
  //
  // @override
  // void initState() {
  //   super.initState();
  //       setState(() {
  //         _controller = VideoPlayerController.file(
  //                 File(widget.path),)..initialize().then((_) {
  //       });
  //     });
  // }



  @override
  Widget build(BuildContext context) {
    // print(_controller);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.crop_rotate,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.emoji_emotions,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.title,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit,
                size: 27,
              )),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 150,
                child:_controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                // _videoPlayerController.value.isInitialized
                //     ? AspectRatio(
                //         aspectRatio: _videoPlayerController.value.aspectRatio,
                //         child: VideoPlayer(_videoPlayerController),
                //       )
                    : Container(color: Colors.white,)),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 6,
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                  decoration: const InputDecoration(
                    hintText: "Add Caption...",
                    prefixIcon: Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                      size: 27,
                    ),
                    suffixIcon: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.teal,
                      child: Icon(
                        Icons.check,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.white, fontSize: 17),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 33,
                backgroundColor: Colors.black38,
                child: InkWell(
                  onTap: (){
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          :_controller.play();
                    });
                  },
                  child: Icon(_controller.value.isPlaying?Icons.pause:Icons.play_arrow,color: Colors.white,size: 50,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
