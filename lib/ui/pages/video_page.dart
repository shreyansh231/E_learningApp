// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPageNew extends StatefulWidget {
//   @override
//   _VideoPageState createState() => _VideoPageState();
// }

// class _VideoPageState extends State<VideoPageNew> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(
//       'assets/videos/your_video.mp4', // Replace with your video asset path
//     )..initialize().then((_) {
//         // Ensure the first frame is shown
//         setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Video Player"),
//       ),
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               )
//             : CircularProgressIndicator(),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               _controller.play();
//             }
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPageNew extends StatefulWidget {
  @override
  _VideoPageNewState createState() => _VideoPageNewState();
}

class _VideoPageNewState extends State<VideoPageNew> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/your_video.mp4', // Replace with your video asset path
    )..initialize().then((_) {
        // Ensure the first frame is shown
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Video Player"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : CupertinoActivityIndicator(),
          ),
          SizedBox(height: 20,),
           CupertinoButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying
              ? CupertinoIcons.pause
              : CupertinoIcons.play_arrow,
          size: 36.0,
        ),
        padding: EdgeInsets.all(16.0),
        color: CupertinoColors.activeBlue,
      ),
        ],
      ),
      // Use a CupertinoButton instead of FloatingActionButton
      
    );
  }
}

void main() {
  runApp(CupertinoApp(
    home: VideoPageNew(),
  ));
}


