// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoPlayerControllerX extends GetxController {
//   VideoPlayerController? videoPlayerController;
//
//   final File? videoFile;
//   final String? videoUrl;
//
//   VideoPlayerControllerX({this.videoFile, this.videoUrl});
//
//   @override
//   void onInit() {
//     super.onInit();
//     if (videoFile != null) {
//       videoPlayerController = VideoPlayerController.file(videoFile!)
//         ..initialize().then((_) {
//           update(); // Notify listeners to update the UI
//         });
//     } else if (videoUrl != null) {
//       videoPlayerController = VideoPlayerController.network(videoUrl!)
//         ..initialize().then((_) {
//           update(); // Notify listeners to update the UI
//         });
//     }
//   }
//
//   @override
//   void onClose() {
//     videoPlayerController?.dispose();
//     super.onClose();
//   }
//
//   void playPause() {
//     if (videoPlayerController != null) {
//       if (videoPlayerController!.value.isPlaying) {
//         videoPlayerController!.pause();
//       } else {
//         videoPlayerController!.play();
//       }
//       update(); // Notify listeners to update the UI
//     }
//   }
// }
